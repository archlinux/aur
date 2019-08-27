# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=autorecon-git
_gitname='autorecon'
pkgver=r51.d705884
pkgrel=1
pkgdesc='Multi-threaded network reconnaissance tool which performs automated enumeration of services.'
arch=(any)
url='https://github.com/Tib3rius/AutoRecon'
license=(GPL)
depends=('python-colorama' 'python-toml')
optdepends=('seclists-git'
            'enum4linux'
            'gobuster'
            'nbtscan'
            'nikto'
            'nmap'
            'onesixtyone'
            'oscanner'
            'smbclient'
            'smbmap'
            'smtp-user-enum'
            'net-snmp'
            'sslscan'
            'sipvicious'
            'tnscmd10g'
            'whatweb'
            'wkhtmltopdf')
conflicts=(autorecon)
provides=(autorecon)
source=("${_gitname}::git+https://github.com/Tib3rius/AutoRecon.git"
        'autorecon.sh')
sha256sums=('SKIP'
            '90b36035e98bffbe2fe7e9a504fa7c6b17bf22d231cf6daea102e5ec055737fe')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${srcdir}/${_gitname}"
  
  install -v -m755 -d "${pkgdir}/opt/${_gitname}/config"
  install -v -m755 -d "${pkgdir}/usr/bin"
  install -v -m755 -d "${pkgdir}/usr/share/doc/${_gitname}"
  install -v -m644 {README.md,LICENSE} "${pkgdir}/usr/share/doc/${_gitname}/"
  install -v -m644 {config/global-patterns.toml,config/port-scan-profiles.toml,config/service-scans.toml} "${pkgdir}/opt/${_gitname}/config/"
  install -v -m644 autorecon.py "${pkgdir}/opt/${_gitname}/"
  install -v -m755 ../autorecon.sh "${pkgdir}/usr/bin/${_gitname}"
}

# vim:set ts=2 sw=2 et:
