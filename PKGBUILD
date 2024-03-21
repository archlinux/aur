# Maintainer: a821 < at mail dot de >
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=bowtie2-git
pkgver=2.5.3.r0.ga43fa6f
pkgrel=1
pkgdesc="Tool for aligning sequencing reads to long reference sequences"
arch=("x86_64")
url="https://bowtie-bio.sourceforge.net/bowtie2"
license=('GPL-3.0-only')
depends=('perl' 'python')
makedepends=('git')
source=("$pkgname::git+https://github.com/BenLangmead/bowtie2")
conflicts=('bowtie2')
provides=('bowtie2')
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
    cd $pkgname
    make PREFIX=/usr
}

package() {
    cd $pkgname
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" \
        AUTHORS BOWTIE2_VERSION MANUAL* NEWS README.md TUTORIAL
    cp -r doc example "$pkgdir/usr/share/doc/$pkgname"
}

# vim: set ts=4 sw=4 et:
