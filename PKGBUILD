# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=('passky-desktop-git')
pkgver=8.1.1.r1.geac8356
pkgrel=1
pkgdesc="Desktop Application for Passky Password Manager"
arch=('x86_64')
url="https://github.com/Rabbit-Company/Passky-Desktop"
license=('GPL3')
makedepends=('git' 'yarn')
provides=('passky-desktop')
conflicts=('passky-desktop')
source=("git+https://github.com/Rabbit-Company/Passky-Desktop.git")
md5sums=('SKIP')

pkgver() {
  cd Passky-Desktop
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd Passky-Desktop
	yarn install
	yarn build --dir
}

package() { 
           cd Passky-Desktop
           install -d ${pkgdir}/opt/passky-desktop
           cp -r dist/linux-unpacked/* ${pkgdir}/opt/passky-desktop
           if [ -f "/usr/local/bin/passky" ]; then
		echo "skipping symlink since already applied"
           else
           	sudo ln -s /opt/passky-desktop/passky /usr/local/bin/passky
	   fi
}
