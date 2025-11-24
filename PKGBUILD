# Maintainer: fr0stb1rd - fr0stb1rd.gitlab.io
pkgname=pdf-metadata-editor-bin
_pkgname=pdf-metadata-editor
pkgver=3.1.1
pkgrel=1
pkgdesc="A simple tool to edit PDF metadata (Java/JAR version)"
arch=('any')
url="https://github.com/zaro/pdf-metadata-editor"
license=('MIT')
depends=('java-runtime' 'bash') # JRE
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.jar"
        "${_pkgname}.desktop"
        "LICENSE")
        
sha512sums=('1eaf0dfd12d1ec4e1f1a1bc2874abb75fcba7711424b642ce51c0239d13d228d9f9a173b2ee735d07831cff93a70d4a3b831576c4e6415a8e0654af33ca5ffe4'
            '397b1f2ad1fa02836335e786cc58032953c1e0a93416164b20db7a62050a394c6f983f1aea19ee2811a349bb1e9348199eb056aedbb5971094cac0e8b60cabb8'
            '071951fc98d1200aa277fb7a3e9c12c10a58e987cd833fa46795721cead1734a6ca18e48e0d6ebc5ef20c962146bf4a7d2709e5a94078e71b964ac0df623d90b')

package() {
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
    install -d "${pkgdir}/usr/bin"
    cat <<EOF > "${pkgdir}/usr/bin/${_pkgname}"
#!/bin/sh
exec java -jar "/usr/share/java/${_pkgname}/${_pkgname}.jar" "\$@"
EOF

    chmod +x "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
