# Maintainer: Erdbeerkaese <erbeerkaese dot arch at gmail dot com>

pkgname=starsector
pkgver=0.95a_RC15
pkgrel=1
pkgdesc="Starsector (formerly “Starfarer”) is an in-development open-world single-player space-combat, roleplaying, exploration, and economic game."
arch=('i686' 'x86_64')
url="http://fractalsoftworks.com/"
license=('custom')
depends=('java-runtime=7' 'openal' 'bash' 'desktop-file-utils')
install='starsector.install'
replaces=('starfarer')
source=(
http://s3.amazonaws.com/fractalsoftworks/starsector/starsector_linux-${pkgver//_/-}.zip
${pkgname}.pdf::http://www.fractalsoftworks.com/starfarer/docs/StarfarerManual.pdf
starsector.sh
starsector.desktop)
sha256sums=('de34d9d8d9c1105b2884aa38b2e39efdb2fa69fdfb46528c114f90ed220f21a8'
            '0d9a2382e1c15e3d471b88eb3770c68f5dd93edc81710e511fd892def9f2ab16'
            '1d59f7e2855783c880ad1d885834f85defd5fd813e81c5f78b0c3e911905c5c8'
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
  
  find data graphics sounds -type f -print0 | xargs -0 chmod 644
  cp -R data graphics sounds "$pkgdir/usr/share/$pkgname/"
}
# vim:set ts=2 sw=2 et:
