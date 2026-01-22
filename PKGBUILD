# Maintainer: Markus Hartung <mail@hartmark.se>

pkgname=junie-eap
_binname=junie
provides=('junie')
conflicts=('junie')

pkgver=624.1
pkgrel=1
pkgdesc="Junie command‑line client"
arch=('x86_64' 'aarch64')
options=('!strip' 'staticlibs')
url="https://github.com/jetbrains-junie/junie"

license=('LicenseRef-Junie')
# License details: https://www.jetbrains.com/legal/docs/terms/jetbrains-junie/

depends=(
  'bash'
  'glibc'
  'gcc-libs'
  'zlib'
  'libx11'
  'libxext'
  'libxrender'
  'libxi'
  'libxtst'
  'alsa-lib'
  'freetype2'
  'harfbuzz'
  'libpng'
  'libjpeg-turbo'
  'lcms2'
  'giflib'
  'pcsclite'
)
optdepends=()

source=('LICENSE')

source_x86_64=("https://github.com/jetbrains-junie/junie/releases/download/${pkgver}/junie-eap-${pkgver}-linux-amd64.zip")
source_aarch64=("https://github.com/jetbrains-junie/junie/releases/download/${pkgver}/junie-eap-${pkgver}-linux-aarch64.zip")

sha512sums=('cb1277b44d0cf8fe650685013b5d4fa4ac01f4f7c42cc90c94990c9dfde71b7ff19210d0f9c766990d56058c0516ddd5b4ba9710da30ceed27cd11dbb1288c52')
sha512sums_x86_64=('af1ac2b8f1ba5721db7a4fc354b2872fb048923cd052e98aefe0d46f142b14ce258bf67d452af8b4bc0d0bc06e8dd80cf42ab3ca4cc7ffa8e0dacd54395a137b')
sha512sums_aarch64=('155a066d4310056a5b4a20200072b4fc1bb7aa78b4fe53788a3992843fbc0db00e60394ae16bd990482856070c654be1e7fe6fb4ddead7c77dfeeb896be248ce')

package() {
    cd "${srcdir}"

    install -dm755 \
        "${pkgdir}/usr/bin" \
        "${pkgdir}/usr/lib/${pkgname}" \
        "${pkgdir}/usr/share/licenses/${pkgname}"

    cp -R --no-preserve=ownership \
        "${srcdir}/junie-app/"* \
        "${pkgdir}/usr/lib/${pkgname}/"

    cat << 'EOF' > "${pkgdir}/usr/bin/${_binname}"
#!/usr/bin/env bash
exec /usr/lib/junie-eap/bin/junie "$@"
EOF

    chmod 755 "${pkgdir}/usr/bin/${_binname}"

    install -Dm644 \
        "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


# vim:set ts=2 sw=2 et:
