# Maintainer: cmuench / torben

# Default language is english Languages to choose from: en, de The script tries
# to infer the langauge from the LANG environment variable. If it starts with
# de, it will use german, otherwise english. To override this, export the
# environment variable ECODMS_LANG to select a non-default value. for example:
# export ECODMS_LANG=de

pkgname=ecodms-client
pkgver=25.01
pkgrel=3
pkgdesc="Document Management Software"
arch=('x86_64')
url="http://www.ecodms.de/index.php/de/"
license=('LicenseRef-ecodms')
depends=('apr' 'bash' 'fontconfig' 'freetype2' 'glib2' 'gtk3' 'libayatana-appindicator' 'libidn' 'libjpeg-turbo' 'libpng' 'libtiff' 'libwebp' 'libx11' 'openjpeg2' 'openssl' 'qt5-base' 'qt5-svg' 'qt5-webchannel' 'qt5-webengine'  'qt5-x11extras' 'sane' 'zlib')
optdepends=('gnome-shell-extension-appindicator')
options=(!strip !debug)
install=${pkgname}.install

source_x86_64=("ecodmsclient-25.01-3_amd64.deb::http://www.ecodms.de/ecodms_250164/noble/ecodmsclient-25.01-3_amd64.deb"
  'LICENSE')
sha256sums_x86_64=(
  '11963092473235377e90aa357876d2aaf774e4eb1072cd9de6090267b2dd20b4'
  '0f8c7ffe3e43c20b8dbf01370c55013b0c1ba18fa8e9a9caa657f1dc98135cb3')

package() {
  if [[ -n "${ECODMS_LANG}" ]]; then
    _LANG="${ECODMS_LANG}"
  elif [[ "${LANG,,}" == de* ]]; then
    _LANG='de'
  else
    _LANG='en'
  fi

  tar -x --no-same-owner -f "${srcdir}/data.tar.gz" -C "${pkgdir}"

  # Set client language
  ln -sf language_${_LANG}.qm "${pkgdir}/opt/ecodms/ecodmsclient/language.qm"

  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
