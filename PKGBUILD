# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
pkgname=stride
pkgver=20060723
pkgrel=1
pkgdesc="Protein secondary structure assignment from atomic coordinates"
arch=('x86_64')
url='https://webclu.bio.wzw.tum.de/stride/'
license=(LicenseRef-stride)
makedepends=(
	gcc
	make
)

depends=(
	glibc
)

b2sums=('0a6fbb7da0a18cc9fbc4beb3214488080e5f6b85b93f87a33f3d6c38385da12707ee0eb2a10a86c9f6dd3884bd043e3f7f36c6aac797da7dc4f351fab047a950'
        '6f477787004fd962b2faf5f0dd1a497067608eb8fcc5d16e161d918ecff7a6b86184eeb5f97ece4465d7595dd64fd0958a6bcedb76f2b666bdc4d0947e51eda0'
        'df077f9234808abe3a9346af6c4a8bde92812cc9f782ad37b75b060166b35686cbcdc2f4b12c26263127dbd3c488660bb2cf70bc553c267cb3e9f70eba68082d'
        '22c33a3dbc2c0a85d3ae8aaf1072e47486f06074422fd60cf9357b513888a754e5b1937fb2c42f35bada0814d61f663a71407df0ccb10a2d973ee97fab3741e1')

source=(
	'https://webclu.bio.wzw.tum.de/stride/stride.tar.gz'
	'https://dev.gentoo.org/~pacho/stride/stride-20060723-update-r1.patch.xz'
	'https://gitweb.gentoo.org/repo/gentoo.git/plain/sci-biology/stride/files/stride-20011129-fix-buildsystem.patch'
	'https://gitweb.gentoo.org/repo/gentoo.git/plain/sci-biology/stride/files/stride-20011129-clang16.patch'
)

prepare() {
	patch -u -N -i stride-20060723-update-r1.patch
	patch -u -N -i stride-20011129-fix-buildsystem.patch
	patch -u -N -i stride-20011129-clang16.patch
}

build() {
	make
}

package() {
	install -Dm755 stride "${pkgdir}/usr/bin/stride"

	install -Dm644 doc/stride.doc "${pkgdir}/usr/share/licenses/${pkgname}/stride.doc"

	install -Dm644 HOW_TO_USER_STRIDE_FOR_CONTACT_ORDER_CALCULATIONS "${pkgdir}/usr/share/${pkgname}/HOW_TO_USER_STRIDE_FOR_CONTACT_ORDER_CALCULATIONS"

	mkdir -p "${pkgdir}/usr/share/${pkgname}/doc"

	install -Dm644 doc/notes.dos "${pkgdir}/usr/share/${pkgname}/doc/notes.dos"
	install -Dm644 doc/notes.mac "${pkgdir}/usr/share/${pkgname}/doc/notes.mac"
	install -Dm644 doc/relnotes.doc "${pkgdir}/usr/share/${pkgname}/doc/relnotes.doc"
	install -Dm644 doc/stride.doc "${pkgdir}/usr/share/${pkgname}/doc/stride.doc"
}
