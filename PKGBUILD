# Maintainer: Eduard Wirch <wirch.eduard@gmail.com>
# Contributor: Louis des Landes <aur@psykar.com>

pkgname=deepgit
pkgver=3.2
pkgrel=1
pkgdesc="A tool to investigate the history of source code."
arch=('any')
url="http://www.syntevo.com/deepgit/"
license=('custom')
depends=(
    'java-environment>=8'
    'hicolor-icon-theme'
    'desktop-file-utils'
)

source=(
    "https://www.syntevo.com/downloads/$pkgname/$pkgname-linux-${pkgver//./_}.tar.gz"
    "deepgit.sh"
    "deepgit.desktop"
)
sha1sums=(
    6d7865feb079ecc8715643a66eeb7feb2a897945
    23a92ccca3e7e452538cc7a9739c86a71dea474c
    8ab2e36b3cb2e6f7b5af70a4ddbe2e9d307d3988
)

package() {
    cd $srcdir
    # Copy ./lib to /usr/share/java/$pkgname/
    install -m 644 -Dt "$pkgdir/usr/share/java/$pkgname/lib/" $srcdir/$pkgname/lib/*

    # Add executable to /usr/bin
    install -T -Dm 755 deepgit.sh $pkgdir/usr/bin/deepgit

    # Copy license
    # /usr/share/licenses/$pkgname/LICENSE
    install -Dt "$pkgdir/usr/share/licenses/$pkgname/" $srcdir/$pkgname/licenses/*
    install -Dt "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/$pkgname/license.html" 

    # Desktop file
    install -Dm 644 -t $pkgdir/usr/share/applications/ deepgit.desktop 

    # Copy other stuff to /usr/share/$pkgname/
    cd $srcdir/$pkgname
    install -m 644 -Dt "$pkgdir/usr/share/$pkgname" changelog.txt known-issues.txt readme-linux.txt

    # Install some icons
    cd $srcdir/$pkgname/bin
    for size in 32 48 64 128
    do
        install -Dm 644 -T deepgit-$size.png $pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/deepgit.png
    done

}
