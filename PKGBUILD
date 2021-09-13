# Maintainer: Ilias Stamatis <ilstam at mailbox dot org>

pkgname=andotp-decrypt
pkgver=0.1.7
pkgrel=1
pkgdesc="A backup decryptor for the andOTP Android app"
arch=(any)
url="https://github.com/asmw/andOTP-decrypt"
license=('GPL3')
depends=('python-docopt' 'python-pillow' 'python-pycryptodome' 'python-pyotp' 'python-pyqrcode')
# the following are sufficient if you care only for andotp_decrypt
# depends=('python-docopt' 'python-pycryptodome')
source=("https://github.com/asmw/andOTP-decrypt/archive/${pkgver}.tar.gz")
sha256sums=('a7e9712b9832edc6a324b04ba7a88710011345e89fda49d7c4d8103b3be0893f')

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
