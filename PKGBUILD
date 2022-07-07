# Maintainer: hertg <aur@her.tg>
pkgname=lightdm-theme-neon-git
pkgver=r60.bed6b26
pkgrel=1
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
	install -dm755 ${pkgdir}/usr/share/web-greeter/themes/neon
	cp -r public/. ${pkgdir}/usr/share/web-greeter/themes/neon
}

