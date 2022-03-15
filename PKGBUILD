# Maintainer: Grigory Romodanovskiy <greg2008200 at gmail dot com>
pkgname=xbindjoy-git
_gitname=XBindJoy
pkgver=r93.e599772
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
source=("git+${url}.git" 'gcc10.patch' 'guile22.patch')
noextract=()
sha256sums=('SKIP'
            'fe60cd4f60ad3406e86e13951706766e499cfc2602fae188c76cec215918c838'
            '7a4cc5332bc6257c768c5482711e286f6aed57f100b39cc88320c8c4092471b6')

pkgver() {
   cd ${_gitname}

   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
   
}

prepare() {
	cd "${_gitname}"
	git apply "${srcdir}/gcc10.patch"
	git apply "${srcdir}/guile22.patch"
}

build() {
	cd ${_gitname}
	make
}


package() {
	cd ${_gitname}
	make DESTDIR="$pkgdir" install
}
