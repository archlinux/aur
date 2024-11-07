# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=sccmhunter-git
_pkgname="${pkgname%-git}"
pkgver=v1.0.6.r19.g7f493d1
pkgrel=1
pkgdesc="Post-ex tool built to streamline identifying, profiling, and attacking SCCM related assets in an Active Directory domain."
arch=('any')
url="https://github.com/garrettfoster13/sccmhunter"
license=(custom)
depends=('python'
         'impacket'
         'python-cmd2'
         'python-cryptography'
         'python-ldap3'
         'python-pandas'
         'python-pyasn1'
         'python-pyasn1-modules'
         'python-pyopenssl'
         'python-pycryptodome'
         'python-requests'
         'python-requests-ntlm'
         'python-requests-toolbelt'
         'python-rich'
         'python-tabulate'
         'python-typer'
         'python-urllib3')
makedepends=('git' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname" "$pkgname-bin")
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# https://wiki.archlinux.org/title/Python_package_guidelines
build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}

