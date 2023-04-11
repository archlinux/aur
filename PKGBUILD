# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=converternow
pkgname=$_pkgname-bin
pkgdesc="The Unit Converter app: easy, immediate and multi-platform (binary release)"
pkgver=4.0.1
pkgrel=1
arch=('x86_64')
url="https://github.com/ferraridamiano/ConverterNOW"
license=('GPL3')
conflicts=($_pkgname)
provides=($_pkgname)
_desktop=$_pkgname.desktop
_commit=6df978d26b568d905448c683d3cdb41ebc4af18c
_url2=https://raw.githubusercontent.com/ferraridamiano/ConverterNOW/$_commit
source=("$url/releases/download/v$pkgver/$_pkgname-linux-x64.tar.gz"
        "$_url2/LICENSE"
        "$_url2/README.md")
sha256sums=('d50b5f5a1709bc6237e5637da3841c7c60cc94d641c716c45128a9c560f0f1f6'
            'SKIP'
            'SKIP')

prepare() {
  # "Create a shortcut"
  echo "Comment=The Unit Converter app: easy, immediate and multi-platform" > $_desktop
  sed -i '1 i\StartupWMClass=Converter NOW' $_desktop
  sed -i '1 i\Icon=/opt/ConverterNOW/data/flutter_assets/assets/app_icons/logo.png' $_desktop
  sed -i '1 i\Type=Application' $_desktop
  sed -i '1 i\Terminal=false' $_desktop
  sed -i '1 i\Exec=converternow %U' $_desktop
  sed -i '1 i\Name=Converter NOW' $_desktop
  sed -i '1 i\[Desktop Entry]' $_desktop
  mkdir -p desktop
  mv $_desktop desktop
}

package() {
  # Create folders
  mkdir -p ConverterNOW
  mkdir -p $pkgdir/opt
  mkdir -p $pkgdir/usr/bin
  # Install
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 desktop/$_desktop -t "$pkgdir/usr/share/applications"
  cp -r data lib $_pkgname ConverterNOW
  cp -r ConverterNOW "$pkgdir/opt/ConverterNOW"
  ln -s /opt/ConverterNOW/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
