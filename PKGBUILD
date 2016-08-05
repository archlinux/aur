# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-geopy
pkgver=1.11.0
pkgrel=1
pkgdesc='Geocoding Toolbox for Python 2. Includes geocoder classes for the OpenStreetMap,ESRI ArcGIS,Google,Baidu,Bing,Yahoo,Yandex,IGN France,GeoNames,NaviData,OpenMapQuest,What3Words,OpenCage,SmartyStreets,geocoder.us, and GeocodeFarm geocoder services.'
arch=('any')
url='https://github.com/geopy/geopy'
license=('custom')
depends=('python2' 
         'python2-requests-oauthlib'
         'python2-pytz')

source=("https://pypi.python.org/packages/source/g/geopy/geopy-${pkgver}.tar.gz")
makedepends=('python2-setuptools')
provides=('python2-geopy-git'
          'geopy'
          'geopy-svn'
          'geopy-svn-reverse-geocode-branch')
conflicts=('python2-geopy-git'
           'geopy'
           'geopy-svn'
           'geopy-svn-reverse-geocode-branch')

build() {
  cd geopy-${pkgver}

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

package() {
  cd geopy-${pkgver}

  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
md5sums=('b73445dc0069550bbd2b09162f7339b3')
sha1sums=('adf80da1b15abf060b1a2e04da1e48cf4f827641')
sha256sums=('4250e5a9e9f7abb990eddf01d1491fc112755e14f76060011c607ba759a74112')
sha512sums=('467e4b438bc25c0f48a1832965c194dc96f7ec0f44a7ecc7796f2b8c340e22cfddee07ef7191f47b3df5141398601551e3f17c9bc0eb257a92848f0716f094ad')
