# Maintainer: Dmitry Kozlyuk <dmitry.kozliuk@gmail.com>
pkgname=sciter-notes-bin
pkgver=20171023
pkgrel=1
pkgdesc='Evernote-like app based on Sciter SDK'
arch=(x86_64)
url='https://notes.sciter.com'
license=(custom)
depends=(at-spi2-core
         expat
         graphite
         gtk3
         harfbuzz
         libffi
         libgcrypt
         libpng
         libsystemd
         libthai
         libxau
         libxcb
         libxdmcp
         libxext
         libxfixes
         libxrender
         lz4
         pcre
         pixman
         xz)
source=('https://notes.sciter.com/distributions/sciter-notes.tar.gz'
        'https://raw.githubusercontent.com/c-smile/sciter-sdk/master/license.htm')
noextract=('license.htm')
md5sums=('9ad614ffe871b773622f62ff0c62fddd'
         '7b76bd57afb126e7d2d89ecbcc4c2717')

package() {
    pushd 'bin.gtk'
    install -m 0755 'libsciter-gtk-64.so' 'notes' -D -t "$pkgdir/opt/$pkgname"
    popd
    install -m 0644 'license.htm' -D -t "$pkgdir/usr/share/licenses/$pkgname"

    local target="$pkgdir/usr/bin/sciter-notes"
    mkdir -p "`dirname $target`"
    ln -rs "$pkgdir/opt/$pkgname/notes" "$target"
}
