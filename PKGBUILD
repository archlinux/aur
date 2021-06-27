# Maintainer: Piotr Rogoza <piotr dot p dot public at gmail dot com>
# Contributor: Arnoud Willemsen <mail at lynthium.com>

pkgbase=nginx-devel
pkgname=(nginx-devel nginx-devel-mod-naxsi)
_pkgname=nginx
pkgver=1.21.0
_nginxver=$pkgver
pkgrel=1
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server - development version'
url="http://nginx.org"
arch=(i686 x86_64 armv6h)
declare -A _modules_url
_common_flags=()
_add2source() {
  local key=$1 url=$2
  if [ $# -ne 2 ]; then
    return 1
  fi
  _modules_url+=([$key]="${url}")
}

# naxsi: NAXSI is an open-source, high performance, low rules maintenance WAF for NGINX {{{2
# @link: https://github.com/nbs-system/naxsi
# @link: https://github.com/nbs-system/naxsi/releases
_naxsi_ver=0.56
_naxsi_url="naxsi-${_naxsi_ver}.tar.gz::https://github.com/nbs-system/naxsi/archive/${_naxsi_ver}.tar.gz"
_add2source naxsi-source $_naxsi_url
_add2source naxsi-rules naxsi.rules

# nchan: a scalable, flexible pub/sub server for the modern web, replacment for push module {{{2
# @link: https://nchan.io/
# @link: https://github.com/slact/nchan/releases
_nchan_ver=1.2.3
_nchan_url="nchan-${_nchan_ver}.tar.gz::https://github.com/slact/nchan/archive/v${_nchan_ver}.tar.gz"
_add2source nchan $_nchan_url

# concat: concatenate files in a given context: CSS and JS files usually {{{2
# @link http://wiki.nginx.org/HttpConcatModule
# @link https://github.com/alibaba/nginx-http-concat/tags
_concat_ver=1.2.2
_concat_url="concat-${_concat_ver}.tar.gz::https://github.com/alibaba/nginx-http-concat/archive/${_concat_ver}.tar.gz"
_add2source concat $_concat_url

# sflow: Operational performance monitoring with standard sFlow protoco {{{2
# @link: https://github.com/m0zes/nginx-sflow-module
# @link: https://github.com/m0zes/nginx-sflow-module/releases
_sflow_ver=0.9.10
_sflow_url="sflow-${_sflow_ver}.tar.gz::https://github.com/m0zes/nginx-sflow-module/archive/release-${_sflow_ver}.tar.gz"
_add2source sflow $_sflow_url

# NgxFancyIndex(git): Like the built-in autoindex module, but fancier {{{2
# @link http://wiki.nginx.org/NgxFancyIndex

# ngx_http_auth_digest(git): HTTP Digest Authentication {{{2
# @link http://wiki.nginx.org/HttpAuthDigestModule

# ngx_http_auth_pam_module: HTTP Basic Authentication using PAM {{{2
# @link http://web.iti.upv.es/~sto/nginx/
# @link https://github.com/stogh/ngx_http_auth_pam_module/
# @link https://github.com/sto/ngx_http_auth_pam_module/releases
_http_auth_pam_ver=1.5.1
http_auth_pam_url="http_auth_pam-${_http_auth_pam_ver}.tar.gz::https://github.com/stogh/ngx_http_auth_pam_module/archive/v${_http_auth_pam_ver}.tar.gz"
_add2source http_auth_pam $_http_auth_pam_url

# ngx_headers_more: Set and clear input and output headers...more than "add"! {{{2
# @link http://wiki.nginx.org/HttpHeadersMoreModule
# @link https://github.com/openresty/headers-more-nginx-module/releases
_headers_more_ver=0.33
_headers_more_url="headers_more-${_headers_more_ver}.tar.gz::https://github.com/agentzh/headers-more-nginx-module/archive/v${_headers_more_ver}.tar.gz"
_add2source headers_more $_headers_more_url

# ModSecurity: Web application firewall {{{2
# @link http://www.modsecurity.org/projects/modsecurity/nginx/index.html
_modsecurity_ver=3.0.0
_modsecurity_url="http://www.modsecurity.org/tarball/$_modsecurity_ver/modsecurity-apache_${_modsecurity_ver}.tar.gz"
_add2source modsecurity $_modsecurity_url

# PageSpeed {{{2
# @link https://developers.google.com/speed/pagespeed/module/build_ngx_pagespeed_from_source
# @link https://github.com/apache/incubator-pagespeed-ngx
# @link https://github.com/apache/incubator-pagespeed-ngx/releases
_psol_ver=1.13.35.2-stable
_psol_url="psol-${_psol_ver}.tar.gz::https://github.com/apache/incubator-pagespeed-ngx/archive/v${_psol_ver}.tar.gz"
_add2source psol $_psol_url
_psol_name="incubator-pagespeed-ngx-${_psol_ver}"

# echo-nginx-module {{{2
# @link https://github.com/openresty/echo-nginx-module

#}}}2
depends=(
gd
geoip
gperftools
libatomic_ops
libxslt
pcre
)
makedepends=(
# passenger
psol
geoip
gperftools
libatomic_ops
subversion
apr-util
)
optdepends=(
"sflowtool: analyzing sFlow data"
)
license=('custom')
install='nginx.install'
backup=(
etc/nginx/fastcgi.conf
etc/nginx/fastcgi_params
etc/nginx/koi-win
etc/nginx/koi-utf
etc/nginx/mime.types
etc/nginx/nginx.conf
etc/nginx/scgi_params
etc/nginx/uwsgi_params
etc/nginx/win-utf
etc/logrotate.d/nginx
)
changelog='CHANGES.pkgbuild.md'
# Changes for nginx
# @link http://nginx.org/en/CHANGES
conflicts=(
nginx
nginx-unstable
nginx-svn
nginx-socket
nginx-development-extra
nginx-spdy
nginx-mainline
)
provides=('nginx')
source=(
http://nginx.org/download/${_pkgname}-${pkgver}.tar.gz
# http://nginx.org/download/${_pkgname}-${pkgver}.tar.gz.asc
nginx.service
nginx.logrotate
nginx.conf.example
nginx.socket
naxsi.rules
${_modules_url[*]}
)
validpgpkeys=(
)
sha256sums=('1a3a889a8f14998286de3b14cc1dd5b2747178e012d6d480a18aa413985dae6f'
            '65f5af0f27ce3c5263d99d70a57fd3b0cb62aa99df786205029e68563e41e1ee'
            '272907d3213d69dac3bd6024d6d150caa23cb67d4f121e4171f34ba5581f9e98'
            '9174cfea524ed4839062dc267d1b561db9f512407682982be42979f98cbdfff7'
            '989b76a9157b7d24788f6b56027d1883d69a744e91d517bca290a88919864b63'
            'e299680e919a97c7ec06b62e4fabc3b5ead837fe486a5f87260bd16d0b51e112'
            'a3dcbab117a9c103bc1ea5200fc00a7b7d2af97ff7fd525f16f8ac2632e30fbf'
            'e299680e919a97c7ec06b62e4fabc3b5ead837fe486a5f87260bd16d0b51e112'
            '68242a30308b21f13de9a36f2aea5c3e34e8a4c0b7c6a37d3369334f6f847d36'
            '51e288999c5903f4062afdca37a602c7ba14242120ba54cf22f90650b646d4dc'
            '0a66dcadd32432460fab180be9f2efe24e911e3798917b2787ee710e02901eb4'
            'ea44d9f33115db4737abe611e63e3f734fa18cb11d998354b093a40eb7a8e6be'
            '1b7d69a9210cf434804eb574618869fba2ddc95d3b0aea7c57205f7a15e920a4'
            '3b27e9eb0478cbba65ba0beb844c5361e2e2f9c21e5bee8803ea9e707f4bbb47')
_addModule() {
  local module=$1 && shift
  local src=$1 && shift

  plain "* $module"

  if [[ "$src" = "github" ]]; then
    src=$(_addGithubModule $module $@)
  elif [[ "$src" =~ ^(https?|ftp):// ]]; then
    src=$(_addExternalModule $module $src)
  elif [[ "$src" =~ ^git:// ]]; then
    src=$(_addGitModule $module $src $@)
  elif [[ "$src" =~ ^svn:// ]]; then
    src=$(_addSvnModule $module $src $@)
  fi

  if [ -d "$src" ]; then
    _common_flags+=(--add-dynamic-module=$src)
  fi
}
_addExternalModule() {
  local module=$1
  local src=$2

  [ -d "$module" ] || curl --silent $src | tar -xz

  echo "$(cd "$module" && pwd)"
}
_addGithubModule() {
  local module=$1
  local github_user=$2
  local branch=$3

  [ -d "./$module/.git" ] || git clone -q git://github.com/$github_user/$module.git
  [ -n "$branch" ] && (cd $module && git checkout -q $branch)

  echo "$(cd "$module" && pwd)"
}
_addGitModule() {
  local module=$1
  local src=$2
  local branch=${3:-''}

  [ -d "./$module/.git" ] || git clone -q $src $module
  [ -n "$branch" ] && (cd $module && git checkout -q $branch)
  echo "$(cd "$module" && pwd)"
}
_addSvnModule() {
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
}
#}}}
if (( DEBUG )); then
  set -o nounset
fi
# nginx env, commons for build and package
export _cfgdir=/etc/nginx
export _tmpdir=/var/lib/nginx
export _logdir=/var/log/nginx

build() {
  local _piddir=/run
  local _lockdir=/var/lock
  local _user=http
  local _group=http

  cd ${_pkgname}-$pkgver
#   msg2 "Adding optional systemd socket activation support"
#   patch -Np1 -i "$srcdir/socket.patch"

  _common_flags=(
    --prefix=$_cfgdir
    --sbin-path=/usr/bin/nginx
    --conf-path=$_cfgdir/nginx.conf
    --error-log-path=$_logdir/error.log
    --pid-path=$_piddir/nginx.pid
    --lock-path=$_lockdir/nginx.lock

    --user=$_user
    --group=$_group

    --with-compat
    --with-file-aio
#     --with-ipv6
#     --with-systemd

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
  _common_flags+=(
#       --with-rtsig_module
    --with-select_module
    --with-poll_module
    --with-threads
  )
  # Optional HTTP modules
  _common_flags+=(
    --with-http_addition_module
    --with-http_degradation_module
    --with-http_slice_module
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
  _common_flags+=(
    --with-mail
    --with-mail_ssl_module
#     --with-imap                               # deprecated
#     --with-imap_ssl_module                    # deprecated
  )
  # Additional modules from various patch
  _common_flags+=(
#     --with-http_spdy_module
    --with-http_v2_module
  )

  # Stream
  _common_flags+=(
    --with-stream
    --with-stream_geoip_module
    --with-stream_realip_module
    --with-stream_ssl_module
    --with-stream_ssl_preread_module
  )

  _modulesdir="$srcdir/modules"

  msg2 "Configuring modules"

  mkdir -p $_modulesdir
  cd $_modulesdir
#   _addModule passenger /usr/lib/passenger/ext/nginx
  _addModule   naxsi-${_naxsi_ver}     $srcdir/naxsi-${_naxsi_ver}/naxsi_src
  _addModule   nchan-${_nchan_ver}     $srcdir/nchan-${_nchan_ver}
  _addModule   concat-${_concat_ver}   $srcdir/nginx-http-concat-${_concat_ver}
  _addModule   ${_psol_name}           $srcdir/$_psol_name}
  # symlink psol library to pagespeed
  if [ ! -L "$srcdir/$_psol_name/include" ]; then
    ln -s /usr/lib/psol/include $srcdir/$_psol_name/include
  fi
#   _addModule sflowtool-${_sflow_ver}                $srcdir/nginx-sflow-module-release-${_sflow_ver}
  _addModule http_auth_pam-${_http_auth_pam_ver}    $srcdir/modules/ngx_http_auth_pam_module-${_http_auth_pam_ver}
  _addModule headers_more-${_headers_more_ver}      $srcdir/headers-more-nginx-module-${_headers_more_ver}
  _addModule modsecurity-$_modsecurity_ver          $srcdir/modsecurity-${_modsecurity_ver}/nginx/modsecurity
  _addModule fancyindex-git                         git://github.com/aperezdc/ngx-fancyindex.git
  _addModule http_auth_digest-git                   git://github.com/samizdatco/nginx-http-auth-digest
  _addModule echo-nginx-module-git                  git://github.com/openresty/echo-nginx-module
#   _addModule owasp-modsecurity-crs                git://github.com/SpiderLabs/owasp-modsecurity-crs.git

  cd "$srcdir"/${_pkgname}-$pkgver
  ./configure ${_common_flags[*]}
  make
  make modules
}
package_nginx-devel() {
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
  chown root:root "$pkgdir"/$_logdir

  install -d "$pkgdir"/usr/share/nginx
  mv "$pkgdir"/etc/nginx/html/ "$pkgdir"/usr/share/nginx

  install -Dm644 "$srcdir"/nginx.logrotate "$pkgdir"/etc/logrotate.d/nginx
  install -Dm644 "$srcdir"/nginx.service "$pkgdir"/usr/lib/systemd/system/nginx.service
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/nginx-devel/LICENSE
#   install -Dm644 "$srcdir"/nginx.socket "$pkgdir"/usr/lib/systemd/system/nginx.socket
  rmdir "$pkgdir"/run

  # man
  install -Dm644 "$srcdir"/${_pkgname}-$pkgver/man/nginx.8 "$pkgdir"/usr/share/man/man8/nginx.8

  install -Dm644 "$srcdir"/nginx.conf.example "$pkgdir"/${_cfgdir}/nginx.conf.example

  for i in ftdetect indent syntax; do
    install -Dm644 contrib/vim/$i/nginx.vim \
      "$pkgdir/usr/share/vim/vimfiles/$i/nginx.vim"
  done
}
package_nginx-devel-mod-naxsi() {

  pkgver=0.55.3
  pkgrel=1
  pkgdesc='Nginx Anti XSS & SQL Injection'
  arch=('i686' 'x86_64')
  depends=("nginx-devel=$_nginxver")
  url="https://github.com/nbs-system/naxsi"
  license=('GPL3')
  backup=(
    etc/nginx/naxsi.rules
    etc/nginx/naxsi_core.rules
  )

  cd "$srcdir"/nginx-$_nginxver/objs
  ls -la
  for mod in *.so; do
    install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done

  install -Dm644 "$srcdir"/naxsi-${_naxsi_ver}/naxsi_config/naxsi_core.rules \
    "$pkgdir"/${_cfgdir}/naxsi_core.rules
  install -Dm644 "$srcdir"/naxsi.rules "$pkgdir"/${_cfgdir}/naxsi.rules
}
