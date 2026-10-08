# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream tags nothing, so pkgver is the pinned commit's date and _tag carries
# the commit itself. The Perl helpers under utils/ convert between the file
# formats of various phasing/association tools and fastARG's own format.

pkgname=fastarg
_tag=841b4971cdf33932f07044b1c6c2fb14000bdd94
pkgver=20161116
pkgrel=1
pkgdesc="Fast heuristic construction of ancestral recombination graphs"
arch=('x86_64')
url="https://github.com/lh3/fastARG"
license=('MIT')
depends=('glibc' 'perl' 'zlib')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${_tag}.tar.gz")
sha256sums=('980e4419a472f6185caff9384e656d17cd1fcaee11344443e32f045b64d1643f')

build() {
    cd "$srcdir/fastARG-$_tag"
    make
}

package() {
    cd "$srcdir/fastARG-$_tag"
    install -Dm755 fastARG "$pkgdir/usr/bin/fastARG"
    install -Dm755 fastARG.pl "$pkgdir/usr/bin/fastARG.pl"
    install -Dm755 phaseARG.pl "$pkgdir/usr/bin/phaseARG.pl"
    install -d "$pkgdir/usr/bin"
    install -m755 utils/*.pl "$pkgdir/usr/bin/"
    # upstream ships no LICENSE file; the grant is the MIT block in kseq.h
    awk 'NR==1,/^\*\//' kseq.h > LICENSE
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
