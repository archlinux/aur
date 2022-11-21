# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-fluidity
pkgver=0.2.1
_commit=468627ea13ed4c3043dc67ccc1ff16089fdb7b25
pkgrel=3
pkgdesc="Fluidity: state machine implementation for Python objects"
url="https://github.com/nsi-iff/fluidity"
license=('MIT')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-should-dsl')
source=("https://github.com/nsi-iff/fluidity/archive/$_commit/$pkgname-$_commit.tar.gz")
sha512sums=('9c80fb3480fe4167247374f4fb8f1d8d8b77cb7d485d26518485b06b628d70f7bf0d538c4b6a08bf071bccff3082c7266e446d1682984a60e447c0d090b0f899')

build() {
  cd fluidity-$_commit
  python3.8 setup.py build
}

check() {
  cd fluidity-$_commit
  (
    export PYTHONPATH="$PWD"
    # Copied from https://github.com/nsi-iff/fluidity/blob/master/tox.ini
    python3.8 spec/callable_support_spec.py
    python3.8 spec/callback_order_spec.py
    python3.8 spec/configuration_spec.py
    python3.8 spec/event_parameters_spec.py
    python3.8 spec/event_spec.py
    python3.8 spec/guard_spec.py
    python3.8 spec/individuation_spec.py
    python3.8 spec/one_event_multiple_transitions_spec.py
    python3.8 spec/state_action_spec.py
    python3.8 spec/state_spec.py
    python3.8 spec/transition_action_spec.py
    python3.8 spec/boolean_state_getters_spec.py
  )
}

package() {
  cd fluidity-$_commit
  python3.8 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
