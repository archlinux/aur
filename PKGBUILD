# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=('spacebar-git')
pkgver=r3678.6bf4637
pkgrel=1
pkgdesc="Spacebar is a free, opensource selfhostable discord-compatible chat, voice and video platform"
arch=('any')
url="https://github.com/spacebarchat/server"
license=('AGPL3')
makedepends=('git' 'nodejs' 'npm' 'python' 'base-devel')
provides=('spacebar')
conflicts=('spacebar')
source=("git+https://github.com/spacebarchat/server.git" "git+https://github.com/0xGingi/spacebarchat-server-aur.git")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd server
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd server
    npm install
    npm run setup
}

package() {
    cd ${srcdir}
    install -d ${pkgdir}/opt/spacebar
    cp -r server/* ${pkgdir}/opt/spacebar
    cd ${srcdir}/spacebarchat-server-aur
    install -Dm0644 "spacebar.service" "${pkgdir}/etc/systemd/system/spacebar.service"

	echo
	echo
	echo -------------------------------------------------------------
	echo 'Spacebar Server is now installed! - READ DOCS AT https://docs.spacebar.chat'
	echo 'Install location - /opt/spacebar'
	echo 'Systemd Service - /etc/systemd/system/spacebar.service'
	echo
	echo 'Start the server with sudo systemctl start spacebar'
	echo 'Spacebar will start at http://localhost:3001'
	echo -------------------------------------------------------------
	echo
	echo
}
