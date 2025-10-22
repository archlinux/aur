# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=blacknon
_pkgname=lssh
_pkgexec=(lssh lscp lsftp)
pkgname=${_pkgname}-bin
pkgver=0.6.13
pkgrel=2
pkgdesc='A list-based SSH/SCP/SFTP client supporting single and parallel connections, local bashrc usage on remote machines, and advanced proxying'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')

provides=("${_pkgexec[@]}")
conflicts=("${_pkgname}")
depends=('glibc')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.md"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('afb11426e09da40a1ae4f8fa17ddcc6b6a52d14df04c29bc5bcd06eb8730624d'
            '7c7ab43e3e6b097606808cf50e994ea5661e8a2dede16a9e7fb564d41989b08e')
sha256sums_x86_64=('4cbcb49180fe903d76ce4f3b93e8cecbe8a92a0c3998edd9ca92b46f75dd0a55')


package() {
  cd "${srcdir}/" || exit

  for bin in ${_pkgexec[@]}; do
    install -Dm755 "./bin/${bin}" "${pkgdir}/usr/bin/${bin}"
  done

  install -Dm644 "./completion/zsh/_${_pkgname}" "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
