# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Michael Witten <mfwitten>
# Contributor: Matthieu Rakotojaona <rakoo>

pkgname=bup-git
pkgver=1385.d926749
pkgrel=1
pkgdesc='Efficient file backup system based on the git packfile format'
arch=('i686' 'x86_64')
url='https://bup.github.io/'
license=('GPL')
depends=('python2-fuse' 'par2cmdline' 'pylibacl' 'python2-pyxattr' 'acl' 'attr' 'git')
optdepends=('python2-tornado: launch a web server to examine backup sets')
makedepends=('pandoc')
#checkdepends=('rsync')
provides=("bup=${pkgver}")
conflicts=("bup")
source=("${pkgname}"::"git+https://github.com/bup/bup.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
	cd "${srcdir}/${pkgname}"

	# Configure the program to use python2 everywhere
	PYTHON=/usr/bin/python2 ./configure
}

build() {
	make -C "${srcdir}/${pkgname}"
}

# Disabled in favor of increased speed - it should pass if run
#check() {
#	make -C "${srcdir}/${pkgname}" test
#}

package() {
	make -C "${srcdir}/${pkgname}" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
