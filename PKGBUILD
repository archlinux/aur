# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=tanks-of-freedom
pkgver=0.7.0
_pkgtag=$pkgver
pkgrel=2
pkgdesc="Indie Turn Based Strategy in Isometric Pixel Art"
arch=('x86_64')
url="https://github.com/w84death/Tanks-of-Freedom"
license=('MIT')
options=('!strip')
makedepends=('godot2')
depends=('libx11' 'libxinerama' 'libxcursor' 'libxrandr' 'libxi' 'alsa-lib' 'libpulse' 'libglvnd' 'glibc')
source=("https://github.com/w84death/Tanks-of-Freedom/archive/$_pkgtag-beta.tar.gz"
        "https://downloads.tuxfamily.org/godotengine/2.1.6/Godot_v2.1.6-stable_export_templates.tpz"
        "Tanks of Freedom.desktop")
sha512sums=('8d71981fe1fa79e5734204bcca7f0ef088c529e25d78bcdc619ed689a8d341223dd2d75328f16d8ff59c0b478117d689fab59f21e12a5056bf8336b18749cad6'
            '97bbc24dcdaeba7051a6e1846301b6da5f7876e72bbb2e524c3c063434d830c289bb5b3c7ae7b2e2a0c5c72d0e12aefc0662c30ebf2ccb5185368f4ce8ca09cf'
            '68c69aed77b8b2d295e6af28f2b82a131368d0aa3620f365f2462ba4b6de51fae34c1a9bc0daa982a81f70a91e8d2f4edc8a6b8efa4a3c5e316126d6220ea9f5')

prepare()
{
  test -f ~/.godot/templates/linux_x11_64_release \
    || mkdir -p ~/.godot/templates/ \
    && cp "$srcdir/templates/linux_x11_64_release" ~/.godot/templates/linux_x11_64_release

  mkdir -p "$srcdir/build"
  cd "$srcdir/Tanks-of-Freedom-$_pkgtag-beta"

  cp buildConfig/export_desktop.cfg export.cfg
  cp -f buildConfig/engine_desktop.cfg engine.cfg
}

build()
{
  cd "$srcdir/Tanks-of-Freedom-$_pkgtag-beta"
  godot2 -export "Linux X11" ./../build/tanks-of-freedom
}

package()
{
  install -d "$pkgdir/usr/bin/"
  install -m 755 "$srcdir/build/tanks-of-freedom" "$pkgdir/usr/bin/tanks-of-freedom"
  install -d "$pkgdir/usr/share/applications"
  install -m 644 "$srcdir/Tanks of Freedom.desktop" "$pkgdir/usr/share/applications/"
  install -d "$pkgdir/usr/share/icons"
  install -m 644 "$srcdir/Tanks-of-Freedom-$_pkgtag-beta/assets/icons/icon1024.png" "$pkgdir/usr/share/icons/tanks-of-freedom-1024.png"
}
