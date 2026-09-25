pkgname=bookshelfng-bin
pkgver=0.4.21.36
pkgrel=1
pkgdesc='Standalone book library manager and download automation server'
arch=('x86_64')
url='https://github.com/snapetech/bookshelfng'
license=('GPL3')
depends=('glibc' 'gcc-libs' 'icu' 'openssl' 'sqlite')
optdepends=('ffmpeg: create chaptered audiobook files')
backup=('etc/bookshelfng/bookshelfng.env')
install=bookshelfng.install
source=("https://github.com/snapetech/bookshelfng/releases/download/main-v${pkgver}/BookshelfNG-main-v${pkgver}-linux-x64.tar.gz"
        'bookshelfng.service'
        'bookshelfng.env'
        'bookshelfng.sysusers'
        'bookshelfng.tmpfiles')
sha256sums=('49a03fdb7abb0efdb94afd40f858fc57af32379e6f3fac7a92e4bf46b50d9f83' '4b804dd1c8b33184af270bb1997defdc866fb8a53b8b8c4cd307c18ebc533aef' '03bb0f783c495bbc1fb137f20df104c9fa02555efbcf6e499918c3eb6a17e86e' 'd500d4bb5f2e851a0fb2123a463f205362c878b722e1d48759c3244be7036b50' '58ff38c5f0b8fc840feb2910b34cb9d4f1829805f141fd21093670932933c420')

package() {
  install -d "${pkgdir}/usr/lib/bookshelfng" "${pkgdir}/usr/bin" "${pkgdir}/etc/bookshelfng"
  install -d "${pkgdir}/usr/lib/systemd/system" "${pkgdir}/usr/lib/sysusers.d" "${pkgdir}/usr/lib/tmpfiles.d"
  cp -a "${srcdir}/BookshelfNG-main-v${pkgver}-linux-x64/." "${pkgdir}/usr/lib/bookshelfng/"
  install -Dm644 "${srcdir}/bookshelfng.service" "${pkgdir}/usr/lib/systemd/system/bookshelfng.service"
  install -Dm644 "${srcdir}/bookshelfng.env" "${pkgdir}/etc/bookshelfng/bookshelfng.env"
  install -Dm644 "${srcdir}/bookshelfng.sysusers" "${pkgdir}/usr/lib/sysusers.d/bookshelfng.conf"
  install -Dm644 "${srcdir}/bookshelfng.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/bookshelfng.conf"
  chmod -R u=rwX,go=rX "${pkgdir}/usr/lib/bookshelfng"
  ln -s /usr/lib/bookshelfng/Readarr "${pkgdir}/usr/bin/bookshelfng"
}
