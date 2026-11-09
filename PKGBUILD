pkgname=bookshelfng-bin
pkgver=0.4.21.84
pkgrel=1
pkgdesc='Standalone book library manager and download automation server'
arch=('x86_64')
url='https://github.com/snapetech-org/bookshelfng'
license=('GPL3')
depends=('glibc' 'gcc-libs' 'icu' 'openssl' 'sqlite')
optdepends=('ffmpeg: create chaptered audiobook files')
backup=('etc/bookshelfng/bookshelfng.env')
install=bookshelfng.install
source=("https://github.com/snapetech-org/bookshelfng/releases/download/v${pkgver}/BookshelfNG-v${pkgver}-linux-x64.tar.gz"
        'bookshelfng.service'
        'bookshelfng.env'
        'bookshelfng.sysusers'
        'bookshelfng.tmpfiles')
sha256sums=('af05dcbf0ddeac2312de13ac617793c61f404bc3421eba2b399a5255e3337f46' '4b804dd1c8b33184af270bb1997defdc866fb8a53b8b8c4cd307c18ebc533aef' 'f850af5d2cdd6a6d703d7ce6273383457af4581e0a12f177a470d1e5acb50c84' 'd500d4bb5f2e851a0fb2123a463f205362c878b722e1d48759c3244be7036b50' '58ff38c5f0b8fc840feb2910b34cb9d4f1829805f141fd21093670932933c420')

package() {
  install -d "${pkgdir}/usr/lib/bookshelfng" "${pkgdir}/usr/bin" "${pkgdir}/etc/bookshelfng"
  install -d "${pkgdir}/usr/lib/systemd/system" "${pkgdir}/usr/lib/sysusers.d" "${pkgdir}/usr/lib/tmpfiles.d"
  cp -a "${srcdir}/BookshelfNG-v${pkgver}-linux-x64/." "${pkgdir}/usr/lib/bookshelfng/"
  install -Dm644 "${srcdir}/bookshelfng.service" "${pkgdir}/usr/lib/systemd/system/bookshelfng.service"
  install -Dm644 "${srcdir}/bookshelfng.env" "${pkgdir}/etc/bookshelfng/bookshelfng.env"
  install -Dm644 "${srcdir}/bookshelfng.sysusers" "${pkgdir}/usr/lib/sysusers.d/bookshelfng.conf"
  install -Dm644 "${srcdir}/bookshelfng.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/bookshelfng.conf"
  chmod -R u=rwX,go=rX "${pkgdir}/usr/lib/bookshelfng"
  ln -s /usr/lib/bookshelfng/Readarr "${pkgdir}/usr/bin/bookshelfng"
}
