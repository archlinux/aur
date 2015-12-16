# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Luke Turner <contact[at]luketurner[dot]org>
pkgname=python2-graphite-web
_pkgname=graphite
pkgver=0.9.15
pkgrel=2
pkgdesc="Graphite provides real-time graphing for monitoring purposes"
url="http://www.graphite.wikidot.com"
arch=('any')
license=('Apache')
depends=('python2'
  'python2-cairo'
  'python2-django-tagging'
  'python2-twisted'
  'python2-pytz'
  'python2-simplejson'
  'python2-twisted'
  'fontconfig'
)
optdepends=('statsd: Feed data to Graphite'
  'uwsgi: Run Graphite server'
  'python2-memcached: Render caching'
  'python2-ldap: LDAP authentication support in the webapp'
  'python2-rrdtool: RRD support'
)
makedepends=()
conflicts=()
replaces=()
backup=()
install='graphite.install'
source=("http://pypi.python.org/packages/source/w/whisper/whisper-${pkgver}.tar.gz"
  "http://pypi.python.org/packages/source/c/carbon/carbon-${pkgver}.tar.gz"
  "http://pypi.python.org/packages/source/g/graphite-web/graphite-web-${pkgver}.tar.gz"
  'uwsgi-graphite.ini'
  'carbon.conf'
  'storage-schemas.conf'
  'local_settings.py'
  'carbon.service'
)

sha256sums=('426b92cba867728a90a743e26dba4c71634c411450307934137e73cb3bbc13b2'
            'f01db6d37726c6fc0a8aaa66a7bf14436b0dd0d62ef3c20ecb31605a4d365d2e'
            'd87425af74c91b06d9552eb58a87464545ad48c53c852eb74d1b6ab4176513b0'
            'decfb241134ff0d02128073945bfd874c4464633cbaf0700ee9e2852f24e235c'
            'c9eda95a5a2938cb225a74f49968072f9904134fc6498792dc5d3e32490f2394'
            'dd73265dd03547b5d36650cafc722ef6d229d969076938264672fd1803e61bae'
            'd22e459579aaae32399a85ce7e2b5d7912935728c0c981dd98f5850bfc553319'
            '9370c9d65a3934bc1a94eed4e4e76b9ef7edc8634ccda2eccf67904536a72186')

build() {
  echo ''
}

package() {
  cd ${srcdir}/carbon-${pkgver}
  python2 setup.py install --root ${pkgdir}
  cd ${srcdir}/whisper-${pkgver}
  python2 setup.py install --root ${pkgdir}
  cd ${srcdir}/graphite-web-${pkgver}
  python2 setup.py install --root ${pkgdir}
  install -D ${srcdir}/uwsgi-graphite.ini ${pkgdir}/opt/${_pkgname}/conf/uwsgi-graphite.ini
  install -D ${srcdir}/carbon.conf ${pkgdir}/opt/${_pkgname}/conf/carbon.conf
  install -D ${srcdir}/storage-schemas.conf ${pkgdir}/opt/${_pkgname}/conf/storage-schemas.conf
  install -D ${srcdir}/local_settings.py ${pkgdir}/opt/${_pkgname}/webapp/graphite/local_settings.py
  install -Dm 644 ${srcdir}/carbon.service "${pkgdir}/usr/lib/systemd/system/carbon.service"
}

# vim:set ts=4 sw=2 et:
