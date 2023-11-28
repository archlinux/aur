# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>
pkgname=ollama-bin
pkgver=0.1.12
pkgrel=2
pkgdesc='Get up and running with large language models, locally'
arch=('x86_64')
url='https://ollama.ai/'
license=('MIT')
provides=('ollama-bin')
source=("${pkgname%-bin}-linux-amd64::https://github.com/jmorganca/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64"
        "ollama.service::https://gitlab.com/mapanare-labs/packages/archlinux/${pkgname%-bin}/-/raw/main/ollama.service"
        "LICENSE::https://raw.githubusercontent.com/jmorganca/ollama/main/LICENSE")
sha256sums=('a890d66c37621aed531dc7795fa62b2ac1b8bebcce87f56c5cef35b026a3ad0f'
            '2c39740ec51b7647d65821ea15b9f3ae8c08512e01aae0ec6bdba6cf3cc4462e'
            '5934ed2ce0d15154bcdb9c85203210abac0da4314af34081e36df4599f90b226')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/${pkgname%-bin}-linux-amd64" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
    echo 'Default systemd service file is included in this package.'
    echo 'you can start the Ollama system service or enable it to run'
    echo 'on boot like with any other service, e.g.'
    echo '# systemctl enable --now ollama.service'
    # Creating user to enable service
    useradd -r -s /bin/false -m -d /usr/share/ollama ollama
}
