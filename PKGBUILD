
# Maintainer: Premysl Srubar <premysl.srubar[äT]gmail(.)com>
pkgbase=fake-background-webcam-git
_pkgname="${pkgbase%-git}"
        
pkgname=('fake-background-webcam-git')
pkgver=r207.acdac9d
pkgrel=1
pkgdesc="Virtual background-replacing camera"
#'python-cmapy>=0.6.6'
depends=('v4l2loopback-dkms' 'python' 'python-opencv>=4.4.0.46' 'opencv' 'python-numpy>=1.19.3' 'python-requests>=2.23.0' 'python-requests-unixsocket' 'python-aiohttp>=3.6.2' 'python-inotify-simple>=1.2' 'python-pyfakewebcam' 'python-mediapipe')
provides=('fake-background-webcam')
conflicts=('fake-background-webcam') 
arch=('x86_64')
url="https://github.com/fangfufu/Linux-Fake-Background-Webcam"
license=("GPL")
makedepends=('git' 'npm')

source=("${pkgname}::git+${url}.git" 
        'fake-background-webcam@.service'
        'readme.md'
        "$_pkgname.install")
        
sha256sums=('SKIP'
            '848d8ff2700ae616b5c1bb69d99d2fc54427a43ca23b54638aeff99833ac59eb'
            'f6b37aff68926eb16c510db56df665ec2a3f8aa7348c0e8ddf247bcaa770a955'
            'b57c70f3b498d646d8834d770d806219b306251c908cc8591b0d711e3638916f')

install=$_pkgname.install            
            
pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package_fake-background-webcam-git() {
  
  
  cd "$srcdir/${pkgbase}"
  install -d "$pkgdir/usr/lib/$_pkgname"
  install -Dm644 *.py "$pkgdir/usr/lib/$_pkgname"
  
  install -d "$pkgdir/var/lib/$_pkgname/default"
  install -Dm644 *.jpg *.png "$pkgdir/var/lib/$_pkgname/default"
  install -Dm644 "${srcdir}/fake-background-webcam@.service" "$pkgdir/usr/lib/systemd/system/$_pkgname@.service"
  
  install -v -m 644 -D "${srcdir}/readme.md" "${pkgdir}/usr/share/doc/${_pkgname}/readme.md"  
}
