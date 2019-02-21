# Maintainer: pescepalla <pescepalla@posteo.me>

pkgname='ibus-typing-booster-git'
pkgdesc='A completion input method for faster typing, git version.'
pkgver=2.5.3.r0.g00b015e
pkgrel=1
url='https://mike-fabian.github.io/ibus-typing-booster/'
arch=('any')
license=('GNU3')
makedepends=('git')

depends=(
		'ibus'
        'm17n-lib'
        'python-dbus'
        'python-gobject'
        'sqlite'
	)
	
optdepends=(
		'python-pyenchant'
	)

provides=("ibus-typing-booster-git")
conflicts=("ibus-typing-booster")
source=("${pkgname}::git+https://github.com/mike-fabian/ibus-typing-booster.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  git describe --long --tags \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname}"
	./autogen.sh
	./configure --prefix=/usr --libexecdir=/usr/lib/ibus
	make
}

#check() {
#	cd "${pkgname}"
#	make check
# }

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir/" install
}
