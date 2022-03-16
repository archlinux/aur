# Maintainer: Grigory Romodanovskiy <greg2008200 at gmail dot com>
pkgname=xbindjoy-git
_gitname=XBindJoy
pkgver=r95.5ffef01
pkgrel=1
pkgdesc="Tool for making your joysticks and gamepads more useful"
arch=(x86_64)
url="https://github.com/saulrh/XBindJoy"
license=('GPL3')
groups=()
depends=('libev' 'libxtst' 'guile')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=("git+${url}.git" 'arch-package.patch')
noextract=()
sha256sums=('SKIP'
            '5cadaa5e7f38015f62ebfbc73d594915ed7d8289ffa2a74b09b84ad9fff44f81')

pkgver() {
   cd ${_gitname}

   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
   
}

prepare() {
	cd "${_gitname}"
	git apply "${srcdir}/arch-package.patch"
}

build() {
	cd ${_gitname}
	make
}


package() {
	cd ${_gitname}
	make DESTDIR="$pkgdir" install
}
