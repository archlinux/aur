# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-geopy
pkgver=1.9.0
pkgrel=1
pkgdesc='Geocoding Toolbox for Python 2. Includes geocoder classes for the OpenStreetMap,ESRI ArcGIS,Google,Baidu,Bing,Yahoo,Yandex,IGN France,GeoNames,NaviData,OpenMapQuest,What3Words,OpenCage,SmartyStreets,geocoder.us, and GeocodeFarm geocoder services.'
arch=('any')
url='https://github.com/geopy/geopy'
license=('custom')
depends=('python2' 
         'python2-requests-oauthlib'
         'python2-pytz')

source=("https://pypi.python.org/packages/source/g/geopy/geopy-${pkgver}.tar.gz")
md5sums=('ec2a0943cfcbac67a410d70b22fe3288')
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
