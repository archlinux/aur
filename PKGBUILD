# Maintainer: Erdbeerkaese <erbeerkaese dot arch at gmail dot com>

pkgname=starsector
pkgver=0.65.2a_RC2
pkgrel=1
pkgdesc="A single-player sandbox style space role-playing game with strategic elements."
arch=('i686' 'x86_64')
url="http://fractalsoftworks.com/"
license=('custom')
depends=('java-runtime' 'openal' 'bash' 'desktop-file-utils')
install='starsector.install'
replaces=('starfarer')
source=(
http://s3.amazonaws.com/fractalsoftworks/starsector/starsector_linux-${pkgver//_/-}.zip
${pkgname}.pdf::http://www.fractalsoftworks.com/starfarer/docs/StarfarerManual.pdf
starsector.sh
starsector.desktop)
sha256sums=('762d2f451d0a6a147e120bc319b3651ee9464b9662a3c9d76faadc4344047c57'
            '0d9a2382e1c15e3d471b88eb3770c68f5dd93edc81710e511fd892def9f2ab16'
            'd0588ccc3eefe399d764144246718344ff5603396130028a798fc1609d4d0286'
            'becc92483d9599672b75d8b00216a64dd8fda38cfcfccd8e735238aa0ce6d8b6')
package() {
  install -d "$pkgdir/usr/share/$pkgname" \
    "$pkgdir/usr/share/doc/$pkgname" \
    "$pkgdir/usr/share/applications" \
    "$pkgdir/usr/share/java/$pkgname" \
    "$pkgdir/usr/lib/$pkgname"

  cd "$srcdir"
  install -Dm644 "${pkgname}.pdf" "$pkgdir/usr/share/doc/$pkgname"
  install -Dm755 "${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications"

  cd "$srcdir/$pkgname"

  install -Dm644 *.jar "$pkgdir/usr/share/java/$pkgname"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  if [[ "$CARCH" == x86_64 ]]; then
    install -Dm644 native/linux/*64.so "$pkgdir/usr/lib/$pkgname/"
  else
    install -Dm644 native/linux/*[!"64"].so "$pkgdir/usr/lib/$pkgname/"
  fi
  
  find data graphics sounds -type f -print | xargs chmod 644
  cp -R data graphics sounds "$pkgdir/usr/share/$pkgname/"
}
# vim:set ts=2 sw=2 et:
