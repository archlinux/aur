#!/usr/bin/env bash

# Maintainer: Paulo Aquino <paulequilibrio at gmail dot com>
# Contributor: Paulo Aquino <paulequilibrio at gmail dot com>

pkgname='kohighlights'
_pkgname='KoHighlights'
pkgver=2.3.1.0
pkgrel=1
pkgdesc="Utility for viewing Koreader's highlights and/or export them to simple text, html, csv or markdown files."
arch=(any)
url='http://www.noembryo.com/apps.php?kohighlights'
license=('MIT')
makedepends=('unzip')
options=(!strip !debug)
depends=('unzip' 'uv')
source=("https://raw.githubusercontent.com/noembryo/${_pkgname}/refs/heads/master/LICENSE"
        "${_pkgname}.png::https://raw.githubusercontent.com/noembryo/${_pkgname}/refs/heads/master/stuff/logo.png"
        "$pkgname-$pkgver.zip::https://github.com/noembryo/${_pkgname}/releases/download/v${pkgver}/${_pkgname}.v${pkgver}.PySide6.zip"
        "${_pkgname}.desktop"
        'patch.sh'
        'pyproject.toml'
        'kohighlights')
noextract=("$pkgname-$pkgver.zip")
sha256sums=('40009217d64cf12427e65ee94e76296d46086cfbc9ca84497c1f8437748d38a3'
            '99de6cd6bc960f50cc67ef8fc8aed8de985907529c70f204a33c98e28c5cba2c'
            'bc77c2963016a5eb43547c1fe6cfb7b36d508066a774bf15eaae3d9ac0da071c'
            '3bdf008c54578dbb3b8f2fc133d5531c1039a7897acaf6c08e93ade5d69d2f76'
            'c621daef1292a59a8f1c289c28b722c6ef90e4fba082d66d3d25e4ff1ad6ff87'
            '11b4bb3c15d5a7a2986d9086c35b3a85d1df756de500f3df7021715f66206ede'
            'bba741b935f3cb27ec13a4e920853cd6b6fef8e057f4dea73500bf654286785e')
install='post.install'

prepare() {
  unzip -qo "$srcdir/$pkgname-$pkgver.zip" -d "$srcdir/${pkgname}-${pkgver}"
  bash patch.sh "${pkgname}-${pkgver}"
  cp "${srcdir}/pyproject.toml" "${srcdir}/${pkgname}-${pkgver}/pyproject.toml"
}

package() {
  install -dm 755 "${pkgdir}"{/opt,/usr/{bin,share/applications}}
  cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
  install -Dm 644 "${srcdir}/${_pkgname}.png" "${pkgdir}/opt/${pkgname}/${_pkgname}.png"
  install -Dm 755 "${srcdir}/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"
  install -Dm 755 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
