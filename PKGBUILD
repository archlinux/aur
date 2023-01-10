# Maintainer: Darkfish Tech <arch@darkfish.com.au>
# Contributor: Ayrton Araujo <root@ayr-ton.net>
# Contributor: Kevin Del Castillo R. <lans9831@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>
pkgname=pyenv-virtualenv
pkgver=1.2.0
pkgrel=1
epoch=1
pkgdesc="pyenv plugin to manage virtualenv (a.k.a. python-virtualenv)"
arch=('any')
url="https://github.com/pyenv/pyenv-virtualenv"
license=('MIT')
depends=('pyenv' 'bash')
makedepends=('patch')
source=("https://github.com/pyenv/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('0c09e896a343ce8cb7d6f57d7e71f9a6')

package() {
  _install_dir="usr/share/pyenv/plugins/pyenv-virtualenv"

  mkdir -p "${pkgdir?}"/{${_install_dir},usr/bin}
  cd "${srcdir?}/$pkgname-$pkgver"

  # Intall using the script
  PREFIX="${pkgdir}/${_install_dir}" ./install.sh 

  # Link binaries
  pushd bin &> /dev/null
  for bin in *; do
      ln -s "/${_install_dir}/bin/$bin" "$pkgdir/usr/bin/$bin"
  done
  popd &> /dev/null

  # License
  mkdir -p "$pkgdir"/usr/share/licenses/pyenv-virtualenv
  cp LICENSE "$pkgdir"/usr/share/licenses/pyenv-virtualenv
}

# vim:set sw=2 sts=2 et:
