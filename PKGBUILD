# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=hedera-icon-theme-git
pkgver=0.r1.4f933d6
pkgrel=1
pkgdesc='A classic icon theme in the spirit of Tango!.'
arch=('any')
url='https://github.com/sixsixfive/Hedera/'
license=('custom:CC-BY-SA 4.0')
depends=('gtk-update-icon-cache')
optdepends=('gtk-engines: for GTK2 theme'
            'gtk-engine-murrine: for GTK2 theme'
            'gdk-pixbuf2: for GTK2 theme'
            'gtk3-nocsd-git: for GTK3 theme'
            'qt5ct: set Qt-Style on non Qt-desktops')
makedepends=('git')
provides=('hedera-icon-theme')
conflicts=('hedera-icon-theme')
options=('!strip')
install='hedera-icon-theme-git.install'
source=('git+https://github.com/sixsixfive/Hedera.git')
sha256sums=('SKIP')

pkgver()
{
  cd Hedera/
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
  cd Hedera/
  install -dm 755 "$pkgdir"/usr/share/
  install -dm 755 "$pkgdir"/usr/share/kf5/infopage/
  install -dm 755 "$pkgdir"/usr/share/kde4/apps/kdeui/about/

  cp -dr --no-preserve='ownership' Plasma/* "$pkgdir"/usr/share/
  cp -dr --no-preserve='ownership' Other/* "$pkgdir"/usr/share/

  cp -dr --no-preserve='ownership' Manual/kf5/infopage/* "$pkgdir"/usr/share/kf5/infopage/
  cp -dr --no-preserve='ownership' Manual/kf5/infopage/* "$pkgdir"/usr/share/kde4/apps/kdeui/about/
  # TODO: install Manual stuff for Chromium and Palemoon
}

# vim: ts=2 sw=2 et:
