# Maintainer: Ilias Stamatis <ilstam at mailbox dot org>

pkgname=andotp-decrypt
pkgver=0.1.4
pkgrel=3
pkgdesc="A backup decryptor for the andOTP Android app"
arch=(any)
url="https://github.com/asmw/andOTP-decrypt"
license=('GPL3')
depends=('python-docopt' 'python-pillow' 'python-pycryptodome' 'python-pyotp' 'python-pyqrcode')
# the following are sufficient if you care only for andotp_decrypt
# depends=('python-docopt' 'python-pycryptodome')
source=("https://github.com/asmw/andOTP-decrypt/archive/${pkgver}.tar.gz")
sha256sums=('e7d4a43531d9e7b496c0e23c0725e0164604e8c20cac5f7eda6372e9b673abf2')

package() {
  # cd "$pkgname"
  cd "${srcdir}/andOTP-decrypt-${pkgver}"
  install -D -m 755 andotp_decrypt.py "${pkgdir}/usr/bin/andotp_decrypt"
  install -D -m 755 generate_code.py "${pkgdir}/usr/bin/generate_code"
  install -D -m 755 generate_qr_codes.py "${pkgdir}/usr/bin/generate_qr_codes"

  # this might be ugly, but...
  local py_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  install -D -m 755 andotp_decrypt.py "${pkgdir}/usr/lib/python${py_version}/site-packages/andotp_decrypt.py"
}
