# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=bazarr
pkgver=0.8.4
pkgrel=2
pkgdesc="Manage and download subtitles for Sonarr and Radarr."
arch=('any')
url="https://github.com/morpheus65535/bazarr"
license=('GPL3')
options=('!strip')
depends=('python2'
         'python2-lxml'
         'python2-gevent')

source=("bazarr-${pkgver}.tar.gz::https://github.com/morpheus65535/bazarr/archive/v${pkgver}.tar.gz"
        'bazarr.service'
        'bazarr.sysusers'
        'bazarr.install'
        'bazarr.tmpfiles')

sha256sums=('346bcc00328561c8b714c80cbf3c41ee7f213bae925c7c28f2ea851538c007ae'
            'fe83f24cdd17b37f19108d93f30b552bc5edbcc23a22f01e9be963f26d7d61d8'
            '92fd48cbd7e5fe3a0388bbe756a52098fc461ef2dc87d9e886452e4f15acdcdc'
            '573beeac951d427e980332ce4d8645ae2299082e6c9c04f96e2a41a98c3acc60'
            '3aa2ebbf4083301d331f36486edcb81fcd094767a0ea404a89d870217d4f6632')

package() {
  install -d -m 755 "${pkgdir}/usr/lib/bazarr"

  # Remove any .gitignore files
  find "${srcdir}/bazarr-${pkgver}/" -name '.gitignore' -delete

  # Remove the empty data folder from the installation
  rm -rf "${srcdir}/bazarr-${pkgver}/data"

  cp -dpr --no-preserve=ownership "${srcdir}/bazarr-${pkgver}/"* "${pkgdir}/usr/lib/bazarr"

  install -D -m 644 "${srcdir}/bazarr.service" "${pkgdir}/usr/lib/systemd/system/bazarr.service"
  install -D -m 644 "${srcdir}/bazarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/bazarr.conf"
  install -D -m 644 "${srcdir}/bazarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/bazarr.conf"
}
