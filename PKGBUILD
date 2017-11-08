# Maintainer: Ainola

pkgname=gtk-theme-ant
pkgver=1.0.3
pkgrel=2
epoch=1
pkgdesc="A flat and light theme with a modern look."
arch=(any)
url="https://github.com/EliverLara/Ant"
license=('GPL3')
source=("ant-$pkgver.tar.xz"::'https://dl.opendesktop.org/api/files/download/id/1510031090/Ant.tar'
        "ant-no-osx-style-buttons-$pkgver.tar.xz"::'https://dl.opendesktop.org/api/files/download/id/1510031101/Ant-no-osx-style-buttons.tar'
        "ant-bloody-$pkgver.tar.xz"::'https://dl.opendesktop.org/api/files/download/id/1510031112/Ant-Bloody.tar'
        "ant-bloody-no-osx-style-buttons-$pkgver.tar.xz"::'https://dl.opendesktop.org/api/files/download/id/1510031121/Ant-Bloody-no-osx-style-buttons.tar'
        "ant-dracula-$pkgver.tar.xz"::'https://dl.opendesktop.org/api/files/download/id/1510031140/Ant-Dracula.tar'
        "ant-dracula-no-osx-style-buttons-$pkgver.tar.xz"::'https://dl.opendesktop.org/api/files/download/id/1510031152/Ant-Dracula-no-osx-style-buttons.tar')
# The Vanilla buttons archives use the same name as their original counterparts
noextract=(
  "ant-no-osx-style-buttons-$pkgver.tar.xz"
  "ant-bloody-no-osx-style-buttons-$pkgver.tar.xz"
  "ant-dracula-no-osx-style-buttons-$pkgver.tar.xz"
)
sha256sums=('26c4ba636fcd621e58c47d7254065b90159d6c4ee54d0bcb135ae24fff1e9fa6'
            'e025ef48d2b3902d02df305ffb5cae67bede26cd56488c09ecbdea2c33655876'
            'a904f0ef96bd24c85ab6ec1c173f9a329e5a97139ab0c59382bff87038d83d41'
            '3bf04194319a550ba65e5814ff5294f8923c42e879dc9356ccf27b110e5e2ee9'
            '693a39d00a2d8421095f0fe4815eef5f5db6cf3e89067f8be097248f6c9f0d62'
            '35d90e5237456caec3d2da21ab76550c4077f4dcfbc19fc0fd056dfeaea52253')
_themes=(
  'Ant'
  'Ant-no-osx-style-buttons'
  'Ant-Bloody'
  'Ant-Bloody-no-osx-style-buttons'
  'Ant-Dracula'
  'Ant-Dracula-no-osx-style-buttons'
)

prepare() {
  mkdir -p "$srcdir/Ant-no-osx-style-buttons"
  bsdtar -C "$srcdir/Ant-no-osx-style-buttons" \
      -xJf "ant-no-osx-style-buttons-$pkgver.tar.xz" --strip-components=1
  mkdir -p "$srcdir/Ant-Bloody-no-osx-style-buttons"
  bsdtar -C "$srcdir/Ant-Bloody-no-osx-style-buttons" \
      -xJf "ant-bloody-no-osx-style-buttons-$pkgver.tar.xz" --strip-components=1
  mkdir -p "$srcdir/Ant-Dracula-no-osx-style-buttons"
  bsdtar -C "$srcdir/Ant-Dracula-no-osx-style-buttons" \
      -xJf "ant-dracula-no-osx-style-buttons-$pkgver.tar.xz" --strip-components=1
}

package() {
  install -dm755 "$pkgdir/usr/share/themes/"

  # Remove a bunch of potential junk that was packaged
  find "$srcdir" -name 'Gulpfile.js' -exec rm {} +
  find "$srcdir" -name 'README.md' -exec rm {} +
  find "$srcdir" -name 'LICENSE' -exec rm {} +
  find "$srcdir" -name 'package.json' -exec rm {} +
  find "$srcdir" -name 'Art' -exec rm -Rf {} +
  find "$srcdir" -name '*.sh' -exec rm {} +
  find "$srcdir" -name '*.txt' -exec rm {} +
  find "$srcdir" -name 'package-lock.json' -exec rm {} +

  for theme in ${_themes[*]}; do
    cp -r "$theme" "$pkgdir/usr/share/themes/"
  done

  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \+
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \+
}

# vim: ts=2 sw=2 et
