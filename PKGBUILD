# Maintainer: Pim Otte <otte dot pim at gmail dot com>
pkgname=syncany
pkgver=0.4.9_alpha
_realver=0.4.9-alpha
pkgrel=1
pkgdesc="Cloud storage and filesharing application with a focus on security and abstraction of storage."
arch=(any)
url="http://www.syncany.org/"
license=('GPL3')
depends=('java-environment>=8' 'sh')
optdepends=('bash-completion: auto completion in bash')
source=("http://syncany.org/dist/$pkgname-${_realver}.tar.gz"
        )
sha256sums=('4632ecc7df58e7bae5f9ac16a49c069ee63fd43418f37c463388650a71cb04c2')

package() {
    install -Dm644 "$srcdir/$pkgname-${_realver}/bash/syncany.bash-completion" "${pkgdir}/etc/bash_completion.d/syncany"

	cd "$srcdir/$pkgname-${_realver}/man/man"
    for man in *
    do
        install -Dm644 "$man" "${pkgdir}/usr/share/man/man1/$man"
        install -Dm644 "$man" "${pkgdir}/usr/share/man/man1/${man/sy/syncany}"
    done


    install -Dm755 "$srcdir/$pkgname-${_realver}/bin/syncany" "${pkgdir}/usr/share/java/${pkgname}/bin/syncany"
    cd "$srcdir/$pkgname-${_realver}/lib"

    for jar in *
    do
        install -Dm644 "$jar" "${pkgdir}/usr/share/java/${pkgname}/lib/$jar"
    done

    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/usr/share/java/${pkgname}/bin/syncany" "${pkgdir}/usr/bin/syncany"


    #Optional: symlink sy
    #ln -s  "/usr/share/java/${pkgname}/bin/syncany" "${pkgdir}/usr/bin/sy"
}
