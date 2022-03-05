#!/usr/bin/env bash

# Maintainer: Paulo Alexandre <paulequilibrio at gmail dot com>

# This package was inspired from https://aur.archlinux.org/packages/irpf by
# Contributor: Márcio Sousa Rocha <marciosr10 at gmail dot com>

# shellcheck disable=SC2154,SC2034
NAME=IRPF
YEAR=2019
pkgname="irpf-${YEAR}"
pkgver=1.7
pkgrel=1
license=('custom')
arch=(any)
pkgdesc="Programa Gerador de Declaração (PGD) da Declaração do Imposto sobre a Renda das Pessoas Físicas (DIRPF) $YEAR"
url='https://www.gov.br/receitafederal/pt-br'
source=(
  "https://downloadirpf.receita.fazenda.gov.br/irpf/${YEAR}/irpf/arquivos/${NAME}${YEAR}-${pkgver}.zip"
  'copyright'
  "$pkgname"
  "$pkgname.desktop"
  "$pkgname.png"
)
md5sums=('4a684e8957c4467f2649bca44fc2ee14'
         '9cd595569e06df745db03c0ee081b96f'
         '12de9d1dc7c19b18c2ad0d14e0f439e0'
         '0ca4a1d0f052731889c8405f6244d174'
         '43d8c9617118578f03b2c4eeb1c72c57')
 
depends=('java-runtime' 'hicolor-icon-theme' 'sh')
 
package() {
  mkdir -p "$pkgdir"/usr/share/{icons/hicolor/128x128/apps,applications,licenses/"$NAME"/"$pkgname","$NAME"/"$pkgname"}
  mkdir "${pkgdir}/usr/bin"
  local BASEDIR="${pkgdir}/usr/share/${NAME}/${pkgname}"

  cd "${srcdir}/${NAME}${YEAR}" || exit
  cp -rf help "$BASEDIR/"
  cp -rf lib "$BASEDIR/"
  cp -rf tutorial "$BASEDIR/"

  install -Dm755 irpf.jar "$BASEDIR/${pkgname}.jar"
  install -Dm644 IRPF${YEAR}.acb "$BASEDIR/"
  install -Dm644 IRPF${YEAR}.ini "$BASEDIR/"
  install -Dm644 Leia-me.htm "$BASEDIR/"
  install -Dm644 offline.png "$BASEDIR/"
  install -Dm644 online.png "$BASEDIR/"
  install -Dm644 pgd-updater.jar "$BASEDIR/"

  install -Dm644 "$srcdir/copyright" "$pkgdir/usr/share/licenses/${NAME}/${pkgname}/"
  install -Dm755 "$srcdir/${pkgname}" "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/${pkgname}.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/"
  install -Dm644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/"
}
