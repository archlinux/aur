#!/usr/bin/env bash

# Maintainer: Paulo Alexandre <paulequilibrio at gmail dot com>

# This package was inspired from https://aur.archlinux.org/packages/irpf by
# Contributor: Márcio Sousa Rocha <marciosr10 at gmail dot com>

# shellcheck disable=SC2154,SC2034
NAME=IRPF
YEAR=2021
pkgname="irpf-${YEAR}"
pkgver=1.9
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
md5sums=('1a87fe2428166e915c84290c5a301818'
         'b430413d18902ace305eb2254e3535db'
         'aacd18e1111652b3dc4afe3e15991532'
         'e08b215ec417ed2d65951690535971f8'
         '43d8c9617118578f03b2c4eeb1c72c57')
 
depends=('java-runtime' 'hicolor-icon-theme' 'sh')
 
package() {
  mkdir -p "$pkgdir"/usr/share/{icons/hicolor/128x128/apps,applications,licenses/"$NAME"/"$pkgname","$NAME"/"$pkgname"}
  mkdir "${pkgdir}/usr/bin"
  local BASEDIR="${pkgdir}/usr/share/${NAME}/${pkgname}"

  cd "${srcdir}/${NAME}${YEAR}" || exit
  cp -rf help "$BASEDIR/"
  cp -rf lib "$BASEDIR/"
  cp -rf lib-modulos "$BASEDIR/"

  install -Dm755 irpf.jar "$BASEDIR/${pkgname}.jar"
  install -Dm644 Leia-me.htm "$BASEDIR/"
  install -Dm644 offline.png "$BASEDIR/"
  install -Dm644 online.png "$BASEDIR/"
  install -Dm644 pgd-updater.jar "$BASEDIR/"

  install -Dm644 "$srcdir/copyright" "$pkgdir/usr/share/licenses/${NAME}/${pkgname}/"
  install -Dm755 "$srcdir/${pkgname}" "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/${pkgname}.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/"
  install -Dm644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/"
}
