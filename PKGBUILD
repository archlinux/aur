# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python-fedmsg
pkgver=1.1.1
pkgrel=1
pkgdesc='Utilities used around Fedora Infrastructure to send and receive messages'
arch=(any)
url='https://fedmsg.readthedocs.org/'
license=(LGPLv2)
depends=('python-kitchen' 'python-pygments' 'python-pyzmq' 'python-arrow')
makedeps=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/0e/59/3a085f378b6200a6b9eb6d8f42654fb35ac181e095221796d5248372eb2f/fedmsg-0.18.2.tar.gz")
source=("https://github.com/fedora-infra/fedmsg/archive/${pkgver}.tar.gz")
sha256sums=('3471f5a2750d2b8742f65c5957bd22ad4a7a09cb97281eb434b938837827eebc')

package() {
  cd "fedmsg-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Ddm755 ${pkgname}/etc/fedmsg.d
  for file in {base.py,endpoints.py,gateway.py,ircbot.py,logging.py,relay.py,ssl.py}; do
    install -D -m644 fedmsg.d/${file} ${pkgdir}/etc/fedmsg.d/${file}
  done
}

# vim:set ts=2 sw=2 et:
