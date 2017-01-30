# Maintainer: Louis des Landes <aur@psykar.com>
pkgname=deepgit
pkgver=1.0.1
pkgrel=1
pkgdesc="A tool to investigate the history of source code."
arch=('any')
url="http://www.syntevo.com/deepgit/"
license=('custom')
depends=(
    'java-runtime'
    'hicolor-icon-theme'
    'bash'
)

source=(
    "https://www.syntevo.com/static/smart/download/$pkgname/$pkgname-linux-${pkgver//./_}.tar.gz"
    "deepgit.sh"
    "deepgit.desktop"
)
sha1sums=(
    45ce76ff2c8e6c2e6700347267dc37462011ee5d
    5e59abc4997dbdfc110df414129950164a01cab1
    8ab2e36b3cb2e6f7b5af70a4ddbe2e9d307d3988
)

package() {
    cd $srcdir
    # Copy ./lib to /usr/share/java/$pkgname/
    # Just be under a folder named lib, or it crashes
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
