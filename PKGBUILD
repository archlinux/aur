# Maintainer: Piotr Rogoza <piotr dot p dot public at gmail dot com>
# Contributor: Piotr Rogoza <piotr dot p dot public at gmail dot com>
# Contributor: Arnoud Willemsen <mail at lynthium.com>

pkgname=nginx-devel
_pkgname=nginx
pkgver=1.9.1
pkgrel=1
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server - development version'
url="http://nginx.org"
arch=(i686 x86_64 armv6h)
# for modules' URL
declare -A _modulesURL
#{{{ Third party modules and patches
_add2source() { #{{{2
  local key=$1 url=$2
  if [ $# -ne 2 ]; then
    return 1
  fi
  _modulesURL+=([$key]="${url}")
} #}}}2
# naxsi: Application firewall {{{2
# @link http://code.google.com/p/naxsi/
# @link https://github.com/nbs-system/naxsi/tags
_naxsi_ver=0.53-2
#_naxsi_url="http://naxsi.googlecode.com/files/naxsi-core-${_naxsi_ver}.tgz"
_naxsi_url="naxsi-${_naxsi_ver}.tar.gz::https://github.com/nbs-system/naxsi/archive/${_naxsi_ver}.tar.gz"
_add2source naxsi $_naxsi_url

# systemd socket activation support {{{2
# @link http://trac.nginx.org/nginx/ticket/237
# _add2source socket socket.patch::http://trac.nginx.org/nginx/raw-attachment/ticket/237/0001-Socket-activation-support-for-systemd.patch
_add2source socket socket.patch::https://lynthium.com/socket.patch

# http push module: This module turns Nginx into an adept HTTP Push and Comet server {{{2
# @link http://pushmodule.slact.net/
_push_ver=0.73
_push_url="https://github.com/slact/nginx_http_push_module/archive/v${_push_ver}.tar.gz"
_add2source push $_push_url

# concat: concatenate files in a given context: CSS and JS files usually {{{2
# @link http://wiki.nginx.org/HttpConcatModule
# @link https://github.com/alibaba/nginx-http-concat/tags
_concat_ver=1.2.2
_concat_url="concat-${_concat_ver}.tar.gz::https://github.com/alibaba/nginx-http-concat/archive/${_concat_ver}.tar.gz"
_add2source concat $_concat_url

# sflow: Operational performance monitoring with standard sFlow protoco {{{2
# @link http://nginx-sflow-module.googlecode.com/
_sflow_ver=0.9.10
_sflow_url="https://github.com/m0zes/nginx-sflow-module/archive/release-${_sflow_ver}.tar.gz"
_add2source sflow $_sflow_url

# NgxFancyIndex(git): Like the built-in autoindex module, but fancier {{{2
# @link http://wiki.nginx.org/NgxFancyIndex

# ngx_http_auth_digest(git): HTTP Digest Authentication {{{2
# @link http://wiki.nginx.org/HttpAuthDigestModule

# ngx_http_auth_pam_module: HTTP Basic Authentication using PAM {{{2
# @link http://web.iti.upv.es/~sto/nginx/
_http_auth_pam_ver=1.3
_http_auth_pam_url="http://web.iti.upv.es/~sto/nginx/ngx_http_auth_pam_module-${_http_auth_pam_ver}.tar.gz"
_add2source http_auth_pam $_http_auth_pam_url

# ngx_headers_more: Set and clear input and output headers...more than "add"! {{{2
# @link http://wiki.nginx.org/HttpHeadersMoreModule
_headers_more_ver=0.25
_headers_more_url="headers_more-${_headers_more_ver}.tar.gz::https://github.com/agentzh/headers-more-nginx-module/archive/v${_headers_more_ver}.tar.gz"
_add2source headers_more $_headers_more_url

# ModSecurity: Web application firewall {{{2
# @link http://www.modsecurity.org/projects/modsecurity/nginx/index.html
_modsecurity_ver=2.9.0
_modsecurity_url="http://www.modsecurity.org/tarball/$_modsecurity_ver/modsecurity-apache_${_modsecurity_ver}.tar.gz"
_add2source modsecurity $_modsecurity_url

# PageSpeed {{{2
# @link https://developers.google.com/speed/pagespeed/module/build_ngx_pagespeed_from_source
_psol_ver=1.9.32.3-beta
_psol_url="https://github.com/pagespeed/ngx_pagespeed/archive/release-${_psol_ver}.zip"
_add2source psol $_psol_url
_psol_name="ngx_pagespeed-release-${_psol_ver}"

# echo-nginx-module(git) {{{2
# @link https://github.com/openresty/echo-nginx-module
#}}}2
# end of Third party modules and patches }}}
# PKGBUILD metadata {{{
depends=( #{{{2
gd
geoip
gperftools
libatomic_ops
libxslt
)
makedepends=( #{{{2
# passenger
psol
geoip
gperftools
libatomic_ops
subversion
)
optdepends=( #{{{2
"sflowtool: analyzing sFlow data"
)
license=('custom')
install='nginx.install'
backup=( #{{{2
etc/nginx/fastcgi.conf
etc/nginx/fastcgi_params
etc/nginx/koi-win
etc/nginx/koi-utf
etc/nginx/mime.types
etc/nginx/nginx.conf
etc/nginx/scgi_params
etc/nginx/uwsgi_params
etc/nginx/win-utf
etc/nginx/naxsi.rules
etc/nginx/naxsi_core.rules
etc/logrotate.d/nginx
)
changelog='CHANGES.pkgbuild.md'
# Changes for nginx
# @link http://nginx.org/en/CHANGES
conflicts=( #{{{2
nginx
nginx-unstable
nginx-svn
nginx-socket
nginx-development-extra
nginx-spdy
) #}}}2
provides=('nginx')
source=( #{{{2
http://nginx.org/download/${_pkgname}-${pkgver}.tar.gz
# http://nginx.org/download/${_pkgname}-${pkgver}.tar.gz.asc
nginx.service
nginx.logrotate
naxsi.rules
nginx.conf.example
nginx.socket
${_modulesURL[*]}
)
validpgpkeys=() #
#}}}2
# shasums {{{2
sha256sums=('09f555fae694c0944f172b575ad239f56d40d14559d98e843de0a690f38c1dad'
            '05fdc0c0483410944b988d7f4beabb00bec4a44a41bd13ebc9b78585da7d3f9b'
            '272907d3213d69dac3bd6024d6d150caa23cb67d4f121e4171f34ba5581f9e98'
            'e299680e919a97c7ec06b62e4fabc3b5ead837fe486a5f87260bd16d0b51e112'
            '9174cfea524ed4839062dc267d1b561db9f512407682982be42979f98cbdfff7'
            '989b76a9157b7d24788f6b56027d1883d69a744e91d517bca290a88919864b63'
            '3eadff1d91995beae41b92733ade28091c2075a24ae37058f4d6aa90b0f4b660'
            'a2a5b53a847493abef89c27360460997bea2b01d1394a7a612f1e13e4cfbb98a'
            '1473f96f59dcec9d83ce65d691559993c1f80da8c0a4c0c0a30dae9f969eeabf'
            '199dff5d11fbb3b6ddf9c8a60cc141970125a3f8e7a06f245e3175e93ca947e3'
            '167100fb198a0a4dd622747cd37ab520f42786f1ee6c7d444f585dacc4d88570'
            '1b7d69a9210cf434804eb574618869fba2ddc95d3b0aea7c57205f7a15e920a4'
            'fd9ba6ede6f993d0b09799aed8979ef29be6f80620737d8900d7f2bdad4c3e91'
            'e2bbf789966c1f80094d88d9085a81bde082b2054f8e38e0db571ca49208f434'
            '3b27e9eb0478cbba65ba0beb844c5361e2e2f9c21e5bee8803ea9e707f4bbb47')
#}}}2
# }}}
# Additional functions, from nginx-development-extra, thx {{{
# build variables
_configure_params=()
add_module() { #{{{2
  local module=$1 && shift
  local src=$1 && shift

  plain "* $module"

  if [[ "$src" == "github" ]]; then
    src=$(_add_github_module $module $@)
  elif [[ "$src" =~ ^(https?|ftp):// ]]; then
    src=$(_add_external_module $module $src)
  elif [[ "$src" =~ ^git:// ]]; then
    src=$(_add_git_module $module $src $@)
  elif [[ "$src" =~ ^svn:// ]]; then
    src=$(_add_svn_module $module $src $@)
  fi

  if [ -d "$src" ]; then
    _configure_params+=(--add-module=$src)
  fi
}
_add_external_module() { #{{{2
  local module=$1
  local src=$2

  [ -d "$module" ] || curl --silent $src | tar -xz

  echo "$(cd "$module" && pwd)"
}
_add_github_module() { #{{{2
  local module=$1
  local github_user=$2
  local branch=$3

  [ -d "./$module/.git" ] || git clone -q git://github.com/$github_user/$module.git
  [ -n "$branch" ] && (cd $module && git checkout -q $branch)

  echo "$(cd "$module" && pwd)"
}
_add_git_module() { #{{{2
  local module=$1
  local src=$2
  local branch=$3

  [ -d "./$module/.git" ] || git clone -q $src $module
  [ -n "$branch" ] && (cd $module && git checkout -q $branch)
  echo "$(cd "$module" && pwd)"
}
_add_svn_module() { #{{{2
  local module=$1
  local src=$2
  local name=$3

  if [[ "$src" =~ ^svn://http:// ]]; then
    src=${src:6}
  fi
  svn checkout $src $name
  if [ -n "$name" ]; then
    echo "$(cd "$name" && pwd)"
  else
    echo "$(cd "$module" && pwd)"
  fi
} #}}}2
#}}}
# nginx env, commons for build and package
_cfgdir=/etc/nginx
_tmpdir=/var/lib/nginx
_logdir=/var/log/nginx
build() { #{{{
  # nginx env
  _piddir=/run
  _lockdir=/var/lock

  _user=http
  _group=http
  cd ${_pkgname}-$pkgver
#   msg2 "Adding optional systemd socket activation support"
  patch -Np1 -i "$srcdir/socket.patch"

  # build options
  _configure_params=(
      --prefix=$_cfgdir
      --sbin-path=/usr/bin/nginx
      --conf-path=$_cfgdir/nginx.conf
      --error-log-path=$_logdir/error.log
      --pid-path=$_piddir/nginx.pid
      --lock-path=$_lockdir/nginx.lock

      --user=$_user
      --group=$_group

      --with-file-aio
      --with-ipv6
      --with-systemd

      --http-log-path=$_logdir/access.log
      --http-client-body-temp-path=$_tmpdir/client-body
      --http-proxy-temp-path=$_tmpdir/proxy
      --http-fastcgi-temp-path=$_tmpdir/fastcgi
      --http-uwsgi-temp-path=$_tmpdir/uwsgi
      --http-scgi-temp-path=$_tmpdir/scgi

      --with-debug
      --with-libatomic
      --with-pcre
      --with-pcre-jit
  )
  # Core modules
  _configure_params+=(
#       --with-rtsig_module
      --with-select_module
      --with-poll_module
#       --with-threads
  )
  # Optional HTTP modules
  _configure_params+=(
      --with-http_addition_module
      --with-http_degradation_module
      --with-http_perl_module
      --with-http_flv_module
      --with-http_gzip_static_module
      --with-http_image_filter_module
      --with-http_mp4_module
      --with-http_random_index_module
      --with-http_realip_module
      --with-http_secure_link_module
      --with-http_stub_status_module
      --with-http_sub_module
      --with-http_dav_module
      --with-http_gunzip_module

      --with-ld-opt="-lstdc++"
      --with-cpp_test_module

      --with-http_xslt_module
      --with-http_ssl_module
      --with-google_perftools_module
      --with-http_geoip_module
      --with-http_auth_request_module
  )
  # Mail modules
  _configure_params+=(
      --with-mail
      --with-mail_ssl_module
      --with-imap
      --with-imap_ssl_module
  )
  # Additional modules from various patch
  _configure_params+=(
      --with-http_spdy_module
  )

  # Stream
  _configure_params+=(
    --with-stream
    --with-stream_ssl_module
  )

  _modulesdir="$srcdir/modules"

  msg2 "Configuring modules"

  mkdir -p $_modulesdir
  cd $_modulesdir

  # passenger
#   add_module passenger /usr/lib/passenger/ext/nginx
  # naxsi
  add_module naxsi-${_naxsi_ver} $srcdir/naxsi-core-${_naxsi_ver}/naxsi_src
  # push
  add_module nginx_http_push_module-${_push_ver} $srcdir/nginx_http_push_module-${_push_ver}
  # concat module
  add_module concat-${_concat_ver} $srcdir/nginx-http-concat-${_concat_ver}
  # pagespeed
  add_module ${_psol_name} $srcdir/$_psol_name}
  # symlink psol library to pagespeed
  #_psol_dir=
  if [ ! -L "$srcdir/$_psol_name/include" ]; then
    ln -s /usr/lib/psol/include $srcdir/$_psol_name/include
  fi
  # sflowtool
  add_module sflowtool-${_sflow_ver} $srcdir/nginx-sflow-module-${_sflow_ver}
  # NgxFancyIndex
  add_module fancyindex-git git@github.com:aperezdc/ngx-fancyindex.git
  # ngx_http_auth_digest
  add_module 'http_auth_digest-git' 'git://github.com/samizdatco/nginx-http-auth-digest'
  # ngx_http_auth_pam
  add_module http_auth_pam-${_http_pam_ver} $srcdir/ngx_http_auth_pam_module-${_http_auth_pam_ver}
  # ngx_headers_more
  add_module headers_more-${_headers_more_ver} $srcdir/headers-more-nginx-module-${_headers_more_ver}
  # modsecurity
  add_module modsecurity-$_modsecurity_ver \
      modsecurity-apache_${_modsecurity_ver}/nginx/modsecurity
  # echo-nginx-module
  add_module echo-nginx-module-git git://github.com/openresty/echo-nginx-module

  cd "$srcdir"/${_pkgname}-$pkgver
  ./configure \
      ${_configure_params[*]}
  make
} # end of build }}}
package() { #{{{
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  sed -e 's|\<user\s\+\w\+;|user html;|g' \
      -e '44s|html|/usr/share/nginx/html|' \
      -e '54s|html|/usr/share/nginx/html|' \
      -i "$pkgdir"/etc/nginx/nginx.conf
  rm "$pkgdir"/etc/nginx/*.default

  install -d "$pkgdir"/$_tmpdir
  install -dm700 "$pkgdir"/$_tmpdir/proxy

  chmod 750 "$pkgdir"/$_logdir
  chown http:log "$pkgdir"/$_logdir

  install -d "$pkgdir"/usr/share/nginx
  mv "$pkgdir"/etc/nginx/html/ "$pkgdir"/usr/share/nginx

  install -Dm644 "$srcdir"/nginx.logrotate "$pkgdir"/etc/logrotate.d/nginx
  install -Dm644 "$srcdir"/nginx.service "$pkgdir"/usr/lib/systemd/system/nginx.service
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/nginx-devel/LICENSE
  install -Dm644 "$srcdir"/nginx.socket "$pkgdir"/usr/lib/systemd/system/nginx.socket
  rmdir "$pkgdir"/run

  # man
  install -Dm644 "$srcdir"/${_pkgname}-$pkgver/man/nginx.8 "$pkgdir"/usr/share/man/man8/nginx.8

  # naxsi
  install -Dm644 "$srcdir"/naxsi-${_naxsi_ver}/naxsi_config/naxsi_core.rules \
    "$pkgdir"/${_cfgdir}/naxsi_core.rules
  install -Dm644 "$srcdir"/naxsi.rules "$pkgdir"/${_cfgdir}/naxsi.rules

  install -Dm644 "$srcdir"/nginx.conf.example "$pkgdir"/${_cfgdir}/nginx.conf.example
} # end of package }}}
# vi: foldmethod=marker
