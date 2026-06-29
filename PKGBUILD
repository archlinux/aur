# Maintainer: qwjyh <urataw421 at gmail dot com>
# Contributor: clanger <virtualdemise at gmail dot com>
# Contributor: Aaron Coach <aur at ezpz dot cz>

_pkgname="powershell-editor-services"
pkgname="$_pkgname-bin"
pkgver=4.7.0
pkgrel=1
pkgdesc='A common platform for PowerShell development support in any editor or application'
url="https://github.com/PowerShell/PowerShellEditorServices"
arch=('x86_64')
license=('MIT')

depends=('powershell')

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

install="$_pkgname.install"

_pkgsrc="PowerShellEditorServices-$pkgver"
_pkgext="zip"

noextract=("$_pkgsrc.$_pkgext")

source=(
  "$_pkgsrc.$_pkgext"::"$url/releases/download/v$pkgver/PowerShellEditorServices.$_pkgext"
  "LICENSE-$pkgver"::"$url/raw/v$pkgver/LICENSE"
)

sha256sums=('5084f0326cc88539e9d880b08f6c52ce5be4672bb8ecee8921e35f8895a6b9d7'
            '99bc3308d3b5f2018c5d7af9239548c6853a01f08db0a1d9247d16be647c5658')

package() {
  mkdir -p "$pkgdir/opt/$_pkgname"
  bsdtar -x -C "$pkgdir/opt/$_pkgname" -f "$srcdir/$_pkgsrc.$_pkgext"

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
