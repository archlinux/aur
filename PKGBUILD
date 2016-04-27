# Maintainer: Alexander Kuznecov <alexander@kuznetcov.me>

_pkgname="nginx"
_user="http"
_group="http"
_doc_root="/usr/share/${_pkgname}/html"
_sysconf_path="etc"
_conf_path="${_sysconf_path}/${_pkgname}"
_tmp_path="/var/spool/${_pkgname}"
_pid_path="/run"
_lock_path="/var/lock"
_log_path="/var/log/${_pkgname}"

### 3d party modules:
_cachepurge_ver="2.3"
_cachepurge_dirname="ngx_cachepurge"
_slowfscache_ver="1.10"
_slowfscache_dirname="ngx_slowfscache"
_echo_ver="v0.58"
_echo_dirname="ngx_echo"
_headersmore_ver="v0.29"
_headersmore_dirname="ngx_headersmore"
_uploadprogress_ver="v0.9.1"
_uploadprogress_dirname="ngx_uploadprogress"
_upstreamfair_hash="a18b4099fbd458111983200e098b6f0c8efed4bc"
_upstreamfair_dirname="ngx_upstreamfair"
_fancyindex_ver="v0.3.6"
_fancyindex_dirname="ngx_fancyindex"
_authpam_ver="1.5.1"
_authpam_dirname="ngx_authpam"
_pagespeed_ver="1.11.33.0"
_pagespeed_dirname="ngx_pagespeed"
_rtmp_ver="v1.1.7"
_rtmp_dirname="ngx_rtmp"
_davext_ver="v0.0.3"
_davext_dirname="ngx_davext"
_naxsi_ver="0.54"
_naxsi_dirname="ngx_naxsi"
_accesskey_ver="2.0.3"
_accesskey_dirname="ngx_accesskey"

pkgname=nginx-custom
pkgver=1.10.0
pkgrel=1
pkgdesc="lightweight HTTP server and IMAP/POP3 proxy server with standard, additional and 3d party modules"
arch=('i686' 'x86_64')

depends=('pcre' 'zlib' 'openssl' 'pam' 'geoip' 'geoip-database' 'gd' 'libxslt')
makedepends=(
  'libxslt'
  'gd'
  'git'
)

url="http://nginx.org"
license=('custom')
conflicts=('nginx' 'nginx-unstable' 'nginx-svn' 'nginx-devel' 'nginx-custom-dev' 'nginx-full') 
provides=('nginx')
backup=("${_conf_path}/nginx.conf"
  "${_conf_path}/koi-win"
  "${_conf_path}/koi-utf"
  "${_conf_path}/win-utf"
  "${_conf_path}/mime.types"
  "${_conf_path}/fastcgi.conf"
  "${_conf_path}/fastcgi_params"
  "${_conf_path}/scgi_params"
  "${_conf_path}/uwsgi_params"
  "etc/logrotate.d/nginx")
_user=http
_group=http

source=("nginx.sh"
    "nginx.conf"
    "nginx.logrotate"
    "nginx.service"
    "http://nginx.org/download/nginx-$pkgver.tar.gz"
    "${_fancyindex_dirname}.tar.gz::https://github.com/aperezdc/ngx-fancyindex/archive/${_fancyindex_ver}.tar.gz"
    "${_cachepurge_dirname}.tar.gz::http://labs.frickle.com/files/ngx_cache_purge-${_cachepurge_ver}.tar.gz"
    "${_slowfscache_dirname}.tar.gz::http://labs.frickle.com/files/ngx_slowfs_cache-${_slowfscache_ver}.tar.gz"
    "${_uploadprogress_dirname}.source::https://github.com/masterzen/nginx-upload-progress-module/tarball/${_uploadprogress_ver}"
    "${_headersmore_dirname}.source::https://github.com/agentzh/headers-more-nginx-module/tarball/${_headersmore_ver}"
    "${_echo_dirname}.source::https://github.com/agentzh/echo-nginx-module/tarball/${_echo_ver}"
    "${_upstreamfair_dirname}.source::https://github.com/gnosek/nginx-upstream-fair/tarball/${_upstreamfair_hash}"
    "${_authpam_dirname}.tar.gz::https://github.com/stogh/ngx_http_auth_pam_module/archive/v${_authpam_ver}.tar.gz"
    "${_pagespeed_dirname}.zip::https://github.com/pagespeed/ngx_pagespeed/archive/v${_pagespeed_ver}-beta.zip"
    "psol.tar.gz::https://dl.google.com/dl/page-speed/psol/${_pagespeed_ver}.tar.gz"
    "${_rtmp_dirname}.zip::https://github.com/arut/nginx-rtmp-module/archive/${_rtmp_ver}.zip"
    "${_davext_dirname}.tar.gz::https://github.com/arut/nginx-dav-ext-module/archive/${_davext_ver}.tar.gz"
    "${_naxsi_dirname}.tar.gz::https://github.com/nbs-system/naxsi/archive/${_naxsi_ver}.tar.gz"
    "${_accesskey_dirname}.tar.gz::https://ostube.googlecode.com/files/Nginx-accesskey-${_accesskey_ver}.tar.gz"
)

md5sums=('d56559ed5e8cc0b1c7adbe33f2300c4c'
         '845cab784b50f1666bbf89d7435ac7af'
         '79031b58828462dec53a9faed9ddb36a'
         '6696dc228a567506bca3096b5197c9db'
         'c184c873d2798c5ba92be95ed1209c02'
         '76ac525432d459a4615a3a8638195ba9'
         '3d4ec04bbc16c3b555fa20392c1119d1'
         '68a1af12d5c1218fb2b3e05ed7ff6f0c'
         'f7dee95dbe8ada5f4d8e9d59ca1f4797'
         '838081f1398965fbf3037bc38d1c2208'
         '6fe61c5b44b2e338c66e1e33ff7e95ab'
         'ac5e7f485476af70e0ee1c52016cddaf'
         '1e0bbd4535386970d63f51064626bc9a'
         '7756ea8925cefe8ed531b3d5b50ca9d2'
         'c503b01cb92f95a5548cf86a2e7415e5'
         'a81e63cd4cf28eaf0c87d27c44e4c44a'
         '2cb502dbda335be4ebd5fed0b3182bae'
         '1bc31058991268e4cfdb44e9b6d8b3b3'
         '8862455846c4ce803ca15300ee08e19a')

build() {
  local _src_dir="${srcdir}/${_pkgname}-${pkgver}"

  mv ngx-fancyindex-* ${_fancyindex_dirname}
  mv ngx_cache_purge-* ${_cachepurge_dirname}
  mv ngx_slowfs_cache-* ${_slowfscache_dirname}
  mv openresty-headers-more-nginx-module-* ${_headersmore_dirname}
  mv openresty-echo-nginx-module-* ${_echo_dirname}
  mv masterzen-nginx-upload-progress-module-* ${_uploadprogress_dirname}
  mv gnosek-nginx-upstream-fair-* ${_upstreamfair_dirname}
  mv ngx_http_auth_pam_module-${_authpam_ver} ${_authpam_dirname}
  mv ngx_pagespeed-* ${_pagespeed_dirname}
  mv psol ${_pagespeed_dirname}/
  mv nginx-accesskey* ${_accesskey_dirname}
  mv nginx-rtmp-module* ${_rtmp_dirname}
  mv nginx-dav-ext-module* ${_davext_dirname}
  mv naxsi* ${_naxsi_dirname}

  cd $_src_dir

  ./configure \
    --prefix="/${_conf_path}" \
    --conf-path="/${_conf_path}/nginx.conf" \
    --sbin-path="/usr/bin/${_pkgname}" \
    --pid-path="${_pid_path}/${_pkgname}.pid" \
    --lock-path=${_pid_path}/${_pkgname}.lock \
    --http-client-body-temp-path=${_tmp_path}/client_body_temp \
    --http-proxy-temp-path=${_tmp_path}/proxy_temp \
    --http-fastcgi-temp-path=${_tmp_path}/fastcgi_temp \
    --http-uwsgi-temp-path=${_tmp_path}/uwsgi_temp \
    --http-scgi-temp-path=${_tmp_path}scgi_temp \
    --http-log-path=${_log_path}/access.log \
    --error-log-path=${_log_path}/error.log \
    --user=${_user} \
    --group=${_group} \
    --with-debug \
    --with-ipv6 \
    --with-mail \
    --with-threads \
    --add-module=../${_naxsi_dirname}/naxsi_src/ \
    --with-imap_ssl_module \
    --with-http_ssl_module \
    --with-http_stub_status_module \
    --with-http_dav_module \
    --with-http_gzip_static_module \
    --with-http_realip_module \
    --with-http_addition_module \
    --with-http_xslt_module \
    --with-http_image_filter_module \
    --with-http_sub_module \
    --with-http_flv_module \
    --with-http_mp4_module \
    --with-http_random_index_module \
    --with-http_secure_link_module \
    --with-http_perl_module \
    --with-http_degradation_module \
    --with-http_geoip_module \
    --with-http_v2_module \
    --with-http_gunzip_module \
    --with-http_auth_request_module \
    --add-module=../${_cachepurge_dirname} \
    --add-module=../${_echo_dirname} \
    --add-module=../${_headersmore_dirname} \
    --add-module=../${_slowfscache_dirname} \
    --add-module=../${_uploadprogress_dirname} \
    --add-module=../${_upstreamfair_dirname} \
    --add-module=../${_fancyindex_dirname} \
    --add-module=../${_authpam_dirname} \
    --add-module=../${_pagespeed_dirname} \
    --add-module=../${_accesskey_dirname} \
    --add-module=../${_rtmp_dirname} \
    --add-module=../${_davext_dirname}

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install

  sed -e "s|\<user\s\+\w\+;|user $_user $_group;|g" \
    -e '44s|html|/usr/share/nginx/html|' \
    -e '54s|html|/usr/share/nginx/html|' \
    -i ${pkgdir}/$_conf_path/nginx.conf

  mkdir -p ${pkgdir}/$_conf_path/sites-enabled/
  mkdir -p ${pkgdir}/$_conf_path/sites-available/

  install -d "${pkgdir}/${_tmp_path}"
  install -d "${pkgdir}/${_doc_root}"

  mv "${pkgdir}/${_conf_path}/html/"* "${pkgdir}/${_doc_root}"
  rm -rf "${pkgdir}/${_conf_path}/html"

  install -D -m555 "${srcdir}/nginx.sh" "${pkgdir}/etc/rc.d/${_pkgname}"
  install -D -m644 "${srcdir}/nginx.logrotate" "${pkgdir}/etc/logrotate.d/${_pkgname}"
  install -D -m644 "${srcdir}/nginx.conf" "${pkgdir}/etc/conf.d/${_pkgname}"
  install -D -m644 "${srcdir}/nginx.service" "${pkgdir}/usr/lib/systemd/system/nginx.service"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m644 "man/nginx.8" "${pkgdir}/usr/share/man/man8/nginx.8"
}

