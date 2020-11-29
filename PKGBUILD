# Maintainer: Ilias Stamatis <ilstam at mailbox dot org>

pkgname=andotp-decrypt
pkgver=0.1.4.r1.g88c9b79
pkgrel=1
pkgdesc="A backup decryptor for the andOTP Android app"
arch=(any)
url="https://github.com/asmw/andOTP-decrypt"
license=('GPL3')
depends=('python-docopt' 'python-pillow' 'python-pycryptodome' 'python-pyotp' 'python-pyqrcode')
# the following are sufficient if you care only for andotp_decrypt
# depends=('python-docopt' 'python-pycryptodome')
makedepends=('git')
source=("${pkgname}::git+https://github.com/asmw/andOTP-decrypt.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  install -D -m 755 andotp_decrypt.py "${pkgdir}/usr/bin/andotp_decrypt"
  install -D -m 755 generate_code.py "${pkgdir}/usr/bin/generate_code"
  install -D -m 755 generate_qr_codes.py "${pkgdir}/usr/bin/generate_qr_codes"

  # this might be ugly, but...
  local py_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  install -D -m 755 andotp_decrypt.py "${pkgdir}/usr/lib/python${py_version}/site-packages/andotp_decrypt/andotp_decrypt.py"
}
