# Maintainer: Markus Hartung <mail@hartmark.se>

pkgname=junie-eap
_binname=junie
provides=('junie')
conflicts=('junie')

pkgver=802.4
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
sha512sums_x86_64=('eebb13394f1384833d513435832e2d8abeea43786ebcfc0d96a1900832f0cadab9ed31509ce96c31bfa980304b984920f46d8254f9288789d3091967ab8eab41')
sha512sums_aarch64=('1878e2a05efe24741d92eb3020a487f800936f2f45233ea26cac8a8dc84ee0a2209f97d69473c49ac48bf0069d16fec29ba6f5e4aa58565561ea938cadde0049')

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
