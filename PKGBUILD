# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=bazarr-git
pkgver=r1800.b10190c5
pkgrel=1
pkgdesc="Manage and download subtitles for Sonarr and Radarr."
arch=('any')
url="https://github.com/morpheus65535/bazarr"
license=('GPL3')
depends=('python'
         'python-lxml')

makedepends=('git')
provides=('bazarr')
conflicts=('bazarr')
options=('!strip')
source=('git+https://github.com/morpheus65535/bazarr'
        'bazarr.service'
        'bazarr.sysusers'
        'bazarr.tmpfiles'
        'bazarr.install')

sha256sums=('SKIP'
            'fe83f24cdd17b37f19108d93f30b552bc5edbcc23a22f01e9be963f26d7d61d8'
            '92fd48cbd7e5fe3a0388bbe756a52098fc461ef2dc87d9e886452e4f15acdcdc'
            '3aa2ebbf4083301d331f36486edcb81fcd094767a0ea404a89d870217d4f6632'
            '573beeac951d427e980332ce4d8645ae2299082e6c9c04f96e2a41a98c3acc60')

pkgver() {
  cd "bazarr"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d -m 755 "${pkgdir}/usr/lib/bazarr"
  cp -dpr --no-preserve=ownership "${srcdir}/bazarr" "${pkgdir}/usr/lib/"
  rm -rf ${pkgdir}/usr/lib/bazarr/.git
  find ${pkgdir}/usr/lib/bazarr/ -name '*.gitignore' -delete
  find ${pkgdir}/usr/lib/bazarr/ -name '*.gitattributes' -delete

  install -D -m 644 "${srcdir}/bazarr.service" "${pkgdir}/usr/lib/systemd/system/bazarr.service"
  install -D -m 644 "${srcdir}/bazarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/bazarr.conf"
  install -D -m 644 "${srcdir}/bazarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/bazarr.conf"
}
