# Maintainer: Black_Codec <orso.f.regna@gmail.com>

pkgname=mywhatsappweb-git
_pkgname=mywhatsappweb
pkgver=r19.60ad04c
pkgrel=1
pkgdesc="Wrapper for WhatsApp web application with support for multiple session and hide in tray"
arch=('any')
url="https://github.com/BlackCodec/mywhatsappweb"
license=('GPL')
depends=('webkit2gtk-4.1' 'libnotify')
makedepends=('vala' 'git')
source=("git+https://github.com/BlackCodec/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
   sed -i "s|@image_path@|/usr/share/icons|g" $srcdir/$_pkgname/src/$_pkgname.desktop
   sed -i "s|@bin_path@|/usr/bin|g" $srcdir/$_pkgname/src/$_pkgname.desktop

}

build() {
   cd "$srcdir/$_pkgname/src/"
   valac --pkg libnotify --pkg gtk+-3.0 --pkg webkit2gtk-4.1 mywhatsappweb.vala -o $_pkgname
}

package() {
   install -Dm 755 "$srcdir/$_pkgname/src/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
   install -Dm 555 "$srcdir/$_pkgname/src/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
   install -Dm 555 "$srcdir/$_pkgname/src/$_pkgname.png" "$pkgdir/usr/share/icons/$_pkgname.png"
}

