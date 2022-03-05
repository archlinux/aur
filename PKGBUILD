#!/usr/bin/env bash

# Maintainer: Paulo Alexandre <paulequilibrio at gmail dot com>

# This package was inspired from https://aur.archlinux.org/packages/irpf by
# Contributor: Márcio Sousa Rocha <marciosr10 at gmail dot com>

# shellcheck disable=SC2154,SC2034
NAME=IRPF
YEAR=2018
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
md5sums=('7e0eec8fcc34d90d9e7888b7ccaef4ed'
         '7b4f64fbc5f95c918c2f9db09c908603'
         '29ba102b96c052b655ed70b6723d45af'
         '4e5cb890abf125a7743091bee69fa4ab'
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
