# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=blacknon
_pkgname=lssh
_pkgexec=(lssh lscp lsftp)
pkgname=${_pkgname}-bin
pkgver=0.7.0
pkgrel=1
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
            '60faccbfbd2bee67318de745ca9e8296fb07dc078ac0012cd1695a12a1737580')
sha256sums_x86_64=('acc2e11452d75af514ed0f2a646437e6b08d91102ec0a1f21c90f9aa188a83e8')


package() {
  cd "${srcdir}/" || exit

  for bin in ${_pkgexec[@]}; do
    install -Dm755 "./bin/${bin}" "${pkgdir}/usr/bin/${bin}"
  done

  install -Dm644 "./completion/zsh/_${_pkgname}" "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
