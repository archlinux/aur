# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=nhiicc
epoch=1
pkgver=20220530
pkgrel=1
arch=(x86_64)
url='https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/mEventesting.htm'
license=(custom)
pkgdesc='台灣健保卡網路註冊憑證元件 (National Health Insurance IC Card)'
# sed and openssl are for commands used in nhiicc.install
depends=(pcsclite sed openssl)
optdepends=(
  'lib32-pcsclite: for using card readers with 32-bit driver only'
)
# XXX: Upstream still use 20220110 for the filename
source=("https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/mLNHIICC_Setup.20220110.tar.gz"
        nhiicc.service
        regen-certs.sh)
# See https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/mEventesting.htm for MD5 sums
md5sums=('af4c8e12bdadef7e6ab2b9b1dabb21d4'
         '3a7ba068b49eab2edca614ea2495e706'
         '605ed8db0ec700bb07ca256c5282ae6a')
install=nhiicc.install

package() {
  install -Dm755 mLNHIICC_Setup."$pkgver"/x64/mLNHIICC -t "$pkgdir"/usr/bin
  install -Dm755 regen-certs.sh -t "$pkgdir"/usr/share/nhiicc/
  cp -dr mLNHIICC_Setup."$pkgver"/html "$pkgdir"/usr/share/nhiicc/
  find "$pkgdir" \( -name '*~' -or -name '._*' \) -delete
  install -Dm644 nhiicc.service -t "$pkgdir"/usr/lib/systemd/system/
}
