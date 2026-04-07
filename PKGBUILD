# Maintainer: tsora <$(echo bmVpdmEuY2VzYXIwN0Bwcm90b24ubWU= | base64 -d)>

_pkgname='pixora-icons'
pkgname="$_pkgname-git"
pkgdesc='16-bit icons theme for Linux desktops. (GIT version)'
pkgver=1.0.0.r292.ga1215de
pkgrel=1
url='https://github.com/tsora1603/pixora-icons'
arch=('any')
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later 
makedepends=('findutils' 'git')
provides=('pixora-icons')
conflicts=("${provides[@]}")
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf '1.0.0.r%s.g%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

package() {
  install -dm755 "$pkgdir/usr/share/icons/pixora-icons"
  cp -fa "$srcdir/$_pkgname/pixora-icons/"* "$pkgdir/usr/share/icons/pixora-icons/"  
  find "$pkgdir/usr/share/icons/pixora-icons" -type d -print0 \
    | xargs -r0 chmod 0755
  find "$pkgdir/usr/share/icons/pixora-icons" -type f -print0 \
    | xargs -r0 chmod 0644

  install -dm755 "$pkgdir/usr/share/icons/pixelitos-light"
  cp -fa "$srcdir/$_pkgname/pixelitos-light/"* "$pkgdir/usr/share/icons/pixelitos-light/"
  find "$pkgdir/usr/share/icons/pixelitos-light" -type d -print0 \
    | xargs -r0 chmod 0755
  find "$pkgdir/usr/share/icons/pixelitos-light" -type f -print0 \
    | xargs -r0 chmod 0644

  install -dm755 "$pkgdir/usr/share/icons/pixelitos-dark"
  cp -fa "$srcdir/$_pkgname/pixelitos-dark/"* "$pkgdir/usr/share/icons/pixelitos-dark/"
  find "$pkgdir/usr/share/icons/pixelitos-dark" -type d -print0 \
    | xargs -r0 chmod 0755
  find "$pkgdir/usr/share/icons/pixelitos-dark" -type f -print0 \
    | xargs -r0 chmod 0644

  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  mv -f "$srcdir/$_pkgname/README.md" \
   "$pkgdir/usr/share/doc/$pkgname/"
  cd "$pkgdir/usr/share/doc" && ln -sr "$pkgname" "$_pkgname"
}

# eof
