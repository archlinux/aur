# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=emojione-fonts
pkgver=3.1.1
pkgrel=2
pkgdesc="Colored emoji fonts from EmojiOne project."
url="https://github.com/emojione/emojione"
arch=(any)
license=(custom)
depends=('fontconfig')
optdepends=('cairo-coloredemoji: (Recommended) display color emoji in all GTK+ apps.')
provides=("$pkgname" 'ttf-emojione')
conflicts=("$pkgname" 'noto-fonts-emoji' 'ttf-emojione')
source=("https://github.com/emojione/emojione/raw/v${pkgver}/extras/fonts/emojione-android.ttf"
        "https://github.com/emojione/emojione/raw/v${pkgver}/extras/fonts/emojione-svg.otf"
        "https://github.com/emojione/emojione/raw/v${pkgver}/extras/fonts/emojione-svg.woff"
        "https://github.com/emojione/emojione/raw/v${pkgver}/extras/fonts/emojione-svg.woff2"
        "70-emojione-color.conf"
        "license-free.pdf")
sha256sums=('6efb1a43873876bcc9476562e20cf8d875eca20bab456d83a580f46a39321139'
            '36b72bfe47556375cd6eee083233da3a9253a3f8a20087a97cd723cd32ffc300'
            '1f759604f74e422cb23870f688f1f03497a194acf320db2bc8bcd87bd28591b1'
            '99f99986c58b813c3f3eb282a4962c6b84ca509a59b02fea3ff942060de44d53'
            'a059c1fa2070d7eb778d8a6048f975d76e343da9e7d946780ccd03d0a83e2cad'
            '2898feeb41e03acd1a655ba5ddad0072aac83a014ee184fdcdebc7a66d353650')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -d "$pkgdir/etc/fonts/"{conf.d,conf.avail}
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 emojione-*.{ttf,otf,woff*}
  install -Dm644 70-emojione-color.conf "$pkgdir/etc/fonts/conf.avail/70-emojione-color.conf"
  ln -sf ../conf.avail/70-emojione-color.conf $pkgdir/etc/fonts/conf.d/70-emojione-color.conf
  install -Dm644 license-free.pdf "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"  
}

# vim:set ts=2 sw=2 et:
