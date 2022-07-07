# Maintainer: hertg <aur@her.tg>
pkgname=lightdm-theme-neon-git
pkgver=r59.b337c02
pkgrel=2
epoch=1
pkgdesc="Modern and customizable theme for web-greeter with a nostalgic neon look"
arch=('any')
url="https://github.com/hertg/lightdm-neon"
license=('GPL')
makedepends=('npm' 'git')
optdepends=()
provides=()
conflicts=()
source=("${pkgname}::git+https://github.com/hertg/lightdm-neon.git")
md5sums=('SKIP')

build() {
  cd $pkgname
	# make install
	npm install
	npm run build
}

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd $pkgname
	# make install
	install -dm644 /usr/share/web-greeter/themes/neon
	cp -r ./public /usr/share/web-greeter/themes/neon
	@echo "Please update your /etc/lightdm/web-greeter.yml manually"
}

