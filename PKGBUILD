# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>

_pkgname=understand
pkgname=$_pkgname-bin
_pkgbuild=833
pkgver=4.0.$_pkgbuild
pkgrel=1
pkgdesc="Static analysis tool for maintaining, measuring & analyzing critical or large code bases."
arch=('i686' 'x86_64')
url="https://scitools.com/"
license=('custom')
depends=('libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext' 'libtinfo5')
options=('!strip' '!upx')

source_i686=("http://builds.scitools.com/all_builds/b$_pkgbuild/${_pkgname^}/${_pkgname^}-$pkgver-Linux-32bit.tgz"
"$_pkgname.desktop"
"$_pkgname")

source_x86_64=("http://builds.scitools.com/all_builds/b$_pkgbuild/${_pkgname^}/${_pkgname^}-$pkgver-Linux-64bit.tgz"
"$_pkgname.desktop"
"$_pkgname")
md5sums_i686=('f4fa953527c0f71e831f5bb44739c567'
              '86ea741c38198d7291d5126ef0cd17f8'
              '2927bc21f24ff8776a1c601379c9f19f')
md5sums_x86_64=('1684d8f63bc8925460529992cdced458'
                '86ea741c38198d7291d5126ef0cd17f8'
                '2927bc21f24ff8776a1c601379c9f19f')


package() {
    _source_arch="32"
    [ "$CARCH" = "x86_64" ] && _source_arch="64"

    install -d "$pkgdir/opt"
    cp -r "$srcdir/scitools" "$pkgdir/opt/"

    [ "$CARCH" = "x86_64" ] && sed -i s/linux32/linux64/ understand
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$pkgdir/opt/scitools/bin/linux$_source_arch/${_pkgname}_64.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

    install -Dm644 "$pkgdir/opt/scitools/conf/license/readme.txt" "$pkgdir/usr/share/licenses/$pkgname/readme.txt"
}
